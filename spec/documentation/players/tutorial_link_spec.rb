require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "TutorialLink" do
  it_should_behave_like "all documentation scenes"
  uses_scene :documentation
  
  before(:each) do
    @link = scene.find_by_name("tutorial_link")[0]
  end
  
  it "should cue an entrance" do
    @link.slideshow = "walkthrough"
    @link.title = "The Walkthrough"
    Entrance.should_receive(:cue_tutorial).with(scene, "walkthrough", "The Walkthrough")
    
    @link.mouse_clicked(nil)
  end  
    
  it "should highlight the clicked link" do
    @link.mouse_clicked(nil)
    
    @link.style.has_extension(scene.styles["selected_toc_item"]).should be_true
  end
  
  it "should unhighlight previously selected links" do
    previous_link = scene.find_by_name("tutorial_link")[1]
    previous_link.style.add_extension(scene.styles['selected_toc_item'])
    
    @link.mouse_clicked(nil)
    
    previous_link.style.has_extension(scene.styles["selected_toc_item"]).should be_false
  end

  it "should highlight he one in the table of contents even if it is clicked from a different location" do
    Entrance.stub!(:cue_tutorial)
    scene.build { tutorial_link :id => "next_slideshow", :toc_link_id => "getting_started_walkthrough" }
    
    scene.find("next_slideshow").mouse_clicked(nil)
    
    scene.find("getting_started_walkthrough").style.has_extension(scene.styles["selected_toc_item"]).should be_true
  end
end
