require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "rdoc_loader"
require 'limelight_rdoc/limelight_rdoc'

describe "RDocLoader" do

  before(:each) do
    @scene = mock("Scene", :rdoc= => nil)
    @loader = RDocLoader.new(@scene)
    @limelight_rdoc = mock(LimelightRDoc::LimelightRDoc, :props_from => nil)
    LimelightRDoc::LimelightRDoc.stub!(:new).and_return(@limelight_rdoc)
  end
  
  it "should load the props from $LIMELIGHT_LIB on production_loaded" do
    @limelight_rdoc.should_receive(:props_from).with($LIMELIGHT_LIB)

    @loader.load
  end

  it "should store the loaded props in rdoc" do
    @limelight_rdoc.stub!(:props_from).and_return("Type doesnt matter")
    
    @scene.should_receive(:rdoc=).with("Type doesnt matter")

    @loader.load
  end

end