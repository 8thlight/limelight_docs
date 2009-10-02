require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'documentation/players/tutorial_link'

describe "TutorialLink" do
  uses_player :tutorial_link
    
  it "should cue an entrance" do
    stub_select_link
    player.slideshow = "walkthrough"
    player.title = "The Walkthrough"
    Entrance.should_receive(:cue_tutorial).with(scene, "walkthrough", "The Walkthrough")
    
    player.mouse_clicked(nil)
  end
  
  it "should select the link with the select link method object" do
    stub_entrance
    scene.should_receive(:select_toc_prop).with(player)
  
    player.mouse_clicked(nil)
  end
  
  def stub_entrance
    Entrance.stub!(:cue_tutorial)
  end
  
  def stub_select_link
    scene.stub!(:select_toc_prop)
  end
end
