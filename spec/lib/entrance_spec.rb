require 'spec_helper'
require 'entrance'

describe Entrance, "installing props from a file" do

  before(:each) do
    @scene = mock("scene")
    @content_pane = mock("pane", :build => nil, :remove_all => nil)
    @scene.stub!(:find).and_return(@content_pane)
  end
    
  it "should install common partial" do
    Entrance.should_receive(:__install).with("documentation/common/sandbox.rb", {})
    @content_pane.should_receive(:build).and_yield
    
    Entrance.cue_common(@scene, "sandbox")
  end
  
  it "should clear the content pane on cueing a slideshow" do
    @content_pane.should_receive(:remove_all)
    
    Entrance.cue_tutorial(@scene, "my_walkthrough", "My Walkthrough")
  end
  
  it "should cue a tutorial" do
    Entrance.should_receive(:__install).with("documentation/entrances/tutorial.rb", :slideshow => "my_walkthrough", :title => "My Walkthrough")
    @content_pane.should_receive(:build).and_yield
    
    Entrance.cue_tutorial(@scene, "my_walkthrough", "My Walkthrough")
  end
  
  it "should install the props from a DSL passed in" do
    #Entrance.should_receive(:eval).with("rdoc_canvas do\nprop :id => 'test prop'\nend")
    #@content_pane.should_receive(:build).and_yield
    #
    #Entrance.cue_rdoc(@scene, "prop :id => 'test prop'")
  end
end
