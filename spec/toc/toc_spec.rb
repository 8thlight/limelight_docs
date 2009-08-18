require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Toc" do
  uses_scene :toc
  
  describe "toc_link" do

    before(:each) do
      @link = scene.find_by_name("toc_link")[0]
    end
    
    it "should clear the content pane" do
      content_pane = mock("pane", :build => nil)
      scene.stub!(:find).and_return(content_pane)
      content_pane.should_receive(:remove_all)
      
      @link.mouse_clicked(nil)
    end
    
    it "should install the specified scene file" do
      @link.scene_file = "walkthrough/props.rb"
      
      @link.mouse_clicked(nil)
      
      prop = scene.find("content_pane")
      prop.children.should_not be_empty
    end
    
  end
end
