$: << File.expand_path(File.dirname(__FILE__) + "/../lib") # See if you can move this to lib spec helper
$: << File.expand_path(File.dirname(__FILE__) + "/..")

# $: << "/Users/eric/Projects/limelight/lib/"
require 'limelight/specs/spec_helper'
require 'rubygems'
require 'spec'

$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../")
Gem.use_paths(File.join($PRODUCTION_PATH , "__resources", "gems"), Gem.default_path)

Dir.glob(File.join("__resources", "gems", "gems", "**", "lib")).each do |dir|
  $: << dir
end

Dir[File.expand_path(File.dirname(__FILE__) + "/support/*.rb")].each {|f| require f}

