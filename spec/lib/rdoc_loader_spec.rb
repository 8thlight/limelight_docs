require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "rdoc_loader"
require 'limelight_rdoc/limelight_rdoc'

describe "RDocLoader" do
  
  # Hack because the rdoc stubbing is carrying into the lib directory.  Must be a better way - but it's late and I"m tired
  def unstub_rdoc
    RDocLoader.unstub(:new)
    rescue Exception => ex
  end

  before(:each) do
    unstub_rdoc
    @styles = {}
    @style = mock("Style", :add_extension => nil, :remove_extension => nil)
    @prop = mock("Prop", :style => @style)
    @scene = mock("Scene", :rdoc= => nil, :find => @prop, :styles => @styles)
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
  
  it "should set the rdoc prop to enabled when the props are loaded" do
    @styles['unselected_toc_heading'] = "Unselected Style"
    @scene.stub!(:find).with("RDoc").and_return(@prop)
    
    @style.should_receive(:add_extension).with("Unselected Style")
    
    @loader.load
  end
  
  it "should remove the disabled_toc_heading from the style as well" do
    @styles['disabled_toc_heading'] = "Disabled Style"
    
    @style.should_receive(:remove_extension).with("Disabled Style")
    
    @loader.load
  end

end