require 'rubygems'
require "bundler/setup"
# This file (production.rb) is the first file loaded opening a production.  It must define a module named 'Production'.
# The containing production will acquire all the behavior defined in this module.
# You may define several hooks and initialization steps here.
def rdoc
  @rdoc
end

def rdoc=(doc)
  @rdoc = doc
end

$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require "toc_section"
require 'output_observer'

# Define this method if you want the production name to be different from the default, directory name.
name = "Limelight Documentation"

# Hook #1.  Called when the production is newly created, before any loading has been done.
# This is a good place to require needed files and instantiate objects in the business layer.
on_production_opened do
  $: << File.expand_path(File.dirname(__FILE__) + "/lib")
  require "toc_section"
  require 'output_observer'
end

# Hook #2.  Called after internal gems have been loaded and stages have been instantiated, yet before
# any scenes have been opened.
on_production_loaded do
  require 'limelight_rdoc/limelight_rdoc'
end

# Hook #3.  Called when the production, and all the scenes, have fully opened.
on_production_opened do
  start_loading_rdoc
end

# The system will call this methods when it wishes to close the production, perhaps when the user quits the
# application.  By default the production will always return true. You may override this behavior by re-doing
# the methods here.
allow_close = true


THREAD_PRIORITY = -1000

def start_loading_rdoc
  thread = Thread.new do
    begin
      doc_scene = theater["default"].current_scene
      output_observer = OutputObserver.new
      begin
        output_observer.infiltrate! { |line| doc_scene.show_activity("Parsing rdoc: #{line}") }
        self.rdoc = LimelightRDoc::LimelightRDoc.new.props_from($LIMELIGHT_LIB)
        doc_scene.enable_rdoc_tab
      ensure
        output_observer.retreat!
      end
      doc_scene.show_activity("")
    rescue StandardError => e
      puts e
      puts e.backtrace
    end
  end
  thread.priority = THREAD_PRIORITY
end

