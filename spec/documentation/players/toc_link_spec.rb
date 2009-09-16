require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "TocLink" do
  uses_scene :documentation
  
  before(:each) do
    @link = scene.find_by_name("toc_link")[0]
  end
  
  it "should cue an entrance" do
    @link.slideshow = "walkthrough"
    @link.title = "The Walkthrough"
    Entrance.should_receive(:cue).with(scene, "walkthrough", "The Walkthrough")
    
    @link.mouse_clicked(nil)
  end  
    
  it "should highlight the clicked link" do
    @link.mouse_clicked(nil)
    
    @link.style.has_extension(scene.styles["selected_toc_item"]).should be_true
  end
  
  it "should unhighlight previously selected links" do
    previous_link = scene.find_by_name("toc_link")[1]
    previous_link.style.add_extension(scene.styles['selected_toc_item'])
    
    @link.mouse_clicked(nil)
    
    previous_link.style.has_extension(scene.styles["selected_toc_item"]).should be_false
  end

end
