$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require 'rubygems'
require 'spec'
require 'limelight/specs/spec_helper'

$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../")
Gem.use_paths(File.join($PRODUCTION_PATH , "__resources", "gems"), Gem.default_path)

Dir.glob(File.join("__resources", "gems", "gems", "**", "lib")).each do |dir|
  $: << dir
end


require "spec/custom_matchers/have_style_extension"

Spec::Runner.configure do |config|
  config.include(HaveStyleExtensionMatcher)
end

def stub_doc_loader
  require 'rdoc_loader'
  mock_loader = Spec::Mocks::Mock.new("RDocLoader", :load => nil)
  RDocLoader.stub!(:new).and_return(mock_loader)
  Kernel.stub!(:sleep)
end