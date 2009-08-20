require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'entrance'

describe Entrance do

  before(:each) do
    @scene = mock("scene")
    @content_pane = mock("pane", :build => nil, :remove_all => nil)
    @scene.stub!(:find).and_return(@content_pane)
  end
  
  it "should clear the content pane" do
    @content_pane.should_receive(:remove_all)
    
    Entrance.cue(@scene, nil)
  end
  
  it "should install the specified scene file" do
    Entrance.should_receive(:__install).with("documentation/entrances/walkthrough.rb")
    @content_pane.should_receive(:build).and_yield
    
    Entrance.cue(@scene, "walkthrough")
  end
  
  it "should install common partial" do
    Entrance.should_receive(:__install).with("documentation/common/sandbox.rb")
    @content_pane.should_receive(:build).and_yield
    
    Entrance.cue_common(@scene, "sandbox")
  end
  
end