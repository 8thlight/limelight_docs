$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require 'rubygems'
require 'spec'
require 'limelight'
$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../")
require 'limelight/specs/spec_helper'

ENV['GEM_HOME'] = File.join($PRODUCTION_PATH , "__resources")
Gem.clear_paths

Dir.glob(File.join("__resources", "gems", "**", "lib")).each do |dir|
  $: << dir
end

Spec::Runner.configure do |config|
end

shared_examples_for "all documentation scenes" do

  before(:each) do
    require 'rdoc_loader'
    mock_loader = Spec::Mocks::Mock.new("RDocLoader", :load => nil)
    RDocLoader.stub!(:new).and_return(mock_loader)
  end

end