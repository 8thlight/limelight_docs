$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

$: << "/Users/eric/Projects/limelight/lib/"
require 'limelight/specs/spec_helper'
require 'rubygems'
require 'spec'


$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../")
Gem.use_paths(File.join($PRODUCTION_PATH , "__resources", "gems"), Gem.default_path)

Dir.glob(File.join("__resources", "gems", "gems", "**", "lib")).each do |dir|
  $: << dir
end

require "spec/custom_matchers/have_style_extension"
require 'rdoc_loader'

def stub_doc_loader
  mock_loader = Spec::Mocks::Mock.new("RDocLoader", :load => nil)
  RDocLoader.stub!(:new).and_return(mock_loader)
  Kernel.stub!(:sleep)
end

Spec::Runner.configure do |config|
  config.include(HaveStyleExtensionMatcher)
  config.prepend_before(:each) do
    stub_doc_loader
  end
end