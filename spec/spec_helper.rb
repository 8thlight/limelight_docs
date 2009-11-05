$: << File.expand_path(File.dirname(__FILE__) + "/../production/lib")
$: << File.expand_path(File.dirname(__FILE__) + "/../production")

require 'rubygems'
require 'spec'
require 'limelight/specs/spec_helper'

$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../production")
Gem.use_paths(File.join($PRODUCTION_PATH , "__resources", "gems"), Gem.default_path)

Dir.glob(File.join("__resources", "gems", "gems", "**", "lib")).each do |dir|
  $: << dir
end

Dir[File.expand_path(File.dirname(__FILE__) + "/support/*.rb")].each {|f| require f}

