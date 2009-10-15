require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "TutorialLink" do
  uses_limelight :scene_path => "documentation" do
    section :id => "section"
    tutorial_link :id => 'tutorial_link'
    link_to_select :id => 'link_to_select'
    slideshow_progress :id => 'slideshow_progress'
    mock_slideshow :id => "slideshow"
  end

  def tutorial_link
    scene.find(:tutorial_link)
  end
  
  before(:each) do
    scene.find("slideshow_progress").stub!(:update_content)
    scene.find("slideshow").stub!(:register_progress_observer)
    stub_select_link
    stub_entrance
  end
  
  it "should cue an entrance" do
    tutorial_link.slideshow = "walkthrough"
    tutorial_link.title = "The Walkthrough"

    Entrance.should_receive(:cue_tutorial).with(scene, "walkthrough", "The Walkthrough")
    tutorial_link.mouse_clicked(nil)
  end

  it "should select the link with itself" do
    scene.should_receive(:select_toc_prop).with(tutorial_link)
    tutorial_link.mouse_clicked(nil)
  end

  it "should update the progress bar" do
    scene.find(:slideshow_progress).should_receive(:update_content)
    
    tutorial_link.mouse_clicked(nil)    
  end
  
  it "should register the progress bar as an observer of the slideshow" do
    slideshow.should_receive(:register_progress_observer).with(slideshow_progress)
    
    tutorial_link.mouse_clicked(nil)
  end
  
  it "should return the section it is in based on the id" do
    tutorial_link.section_id = "section"
    
    tutorial_link.section.should == scene.find('section')
  end
  
  def slideshow_progress
    scene.find("slideshow_progress")
  end
  
  def slideshow
    scene.find("slideshow")
  end
  
  def stub_entrance
    Entrance.stub!(:cue_tutorial)
  end

  def stub_select_link
    scene.stub!(:select_toc_prop)
  end
end
