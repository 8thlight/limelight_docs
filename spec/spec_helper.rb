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

  config.before(:each) do
    require 'limelight_rdoc/limelight_rdoc'
    limelight_rdoc = Spec::Mocks::Mock.new("LimelightRDoc::LimelightRDoc", :props_from => {})
    LimelightRDoc::LimelightRDoc.stub!(:new).and_return(limelight_rdoc)
  end
end