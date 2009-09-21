require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'entrance'

describe Entrance do

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
  
  it "should cue rdoc" do
    Entrance.should_receive(:__install).with("rdoc/Client.rb", {})
    @content_pane.should_receive(:build).and_yield
    
    Entrance.cue_rdoc(@scene, "Client.rb")
  end
  
  it "should should remove all props on the pane on cue_rdoc" do
    @content_pane.should_receive(:remove_all)
    
    Entrance.cue_rdoc(@scene, "Client.rb")
  end
  
end