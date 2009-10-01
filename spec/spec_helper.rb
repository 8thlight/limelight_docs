$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require 'rubygems'
require 'spec'
require 'limelight/specs/spec_helper'

# Set the Gem home to the frozen gems
$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../")
ENV['GEM_HOME'] = File.join($PRODUCTION_PATH , "__resources")
Gem.clear_paths

Dir.glob(File.join("__resources", "gems", "**", "lib")).each do |dir|
  $: << dir
end

Spec::Runner.configure do |config|
end

def stub_doc_loader
  require 'rdoc_loader'
  mock_loader = Spec::Mocks::Mock.new("RDocLoader", :load => nil)
  RDocLoader.stub!(:new).and_return(mock_loader)
  Kernel.stub!(:sleep)
end