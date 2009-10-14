require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "TutorialLink" do
  uses_limelight :scene_path => "documentation" do
    tutorial_link :id => 'tutorial_link'
    link_to_select :id => 'link_to_select'
    slideshow_progress :id => 'slideshow_progress'
  end
  
  def tutorial_link
    scene.find(:tutorial_link)
  end
  
  before(:each) do
    scene.find("slideshow_progress").stub!(:update_content)
    stub_select_link
    stub_entrance
  end
  
  it "should cue an entrance" do
    tutorial_link.slideshow = "walkthrough"
    tutorial_link.title = "The Walkthrough"
    
    Entrance.should_receive(:cue_tutorial).with(scene, "walkthrough", "The Walkthrough")
    tutorial_link.mouse_clicked(nil)
  end
  
  it "should select the link with the select link method object - based on the toc_link_id" do
    tutorial_link.toc_link_id = "link_to_select"
    
    scene.should_receive(:select_toc_prop).with(scene.find('link_to_select'))
    tutorial_link.mouse_clicked(nil)
  end

  it "should update the progress bar" do
    scene.find(:slideshow_progress).should_receive(:update_content)
    
    tutorial_link.mouse_clicked(nil)    
  end
  
  def stub_entrance
    Entrance.stub!(:cue_tutorial)
  end
  
  def stub_select_link
    scene.stub!(:select_toc_prop)
  end
end
