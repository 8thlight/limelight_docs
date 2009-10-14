$: << File.expand_path(File.dirname(__FILE__) + "/../lib") # See if you can move this to lib spec helper

$: << "/Users/eric/Projects/limelight/lib/"
require 'limelight/specs/spec_helper'
require 'rubygems'
require 'spec'

$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../")
Gem.use_paths(File.join($PRODUCTION_PATH , "__resources", "gems"), Gem.default_path)

Dir.glob(File.join("__resources", "gems", "gems", "**", "lib")).each do |dir|
  $: << dir
end

def with_stubbed_doc_loader
  
  before(:each) do
    require 'rdoc_loader'
    mock_loader = Spec::Mocks::Mock.new("RDocLoader", :load => nil)
    RDocLoader.stub!(:new).and_return(mock_loader)
    Kernel.stub!(:sleep)
  end
  
  yield
end

require "spec/custom_matchers/have_style_extension"
Spec::Runner.configure do |config|
  config.include(HaveStyleExtensionMatcher)
end