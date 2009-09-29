require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "TutorialLink" do
  before(:each) do
    stub_doc_loader
  end
  
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
  
  it "should select the link with the select link method object" do
    @link.toc_link_id = "Blah"
    select_link = mock(SelectLink)
    SelectLink.should_receive(:new).with({:scene => scene, :name => "tutorial_link", :id => @link.toc_link_id}).and_return(select_link)
    select_link.should_receive(:select)

    @link.mouse_clicked(nil)
  end
end
