require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Documentation" do
  uses_scene :documentation
  
  describe "toc_link" do
    
    before(:each) do
      @link = scene.find_by_name("toc_link")[0]
    end
    
    it "should cue an entrance" do
      Entrance.should_receive(:cue).with(scene, "walkthrough")
      @link.entrance = "walkthrough"
      
      @link.mouse_clicked(nil)
    end  
    
    it "should install the specified entrance file" do
      @link.entrance = "getting_started"
      
      @link.mouse_clicked(nil)
      
      prop = scene.find("content_pane")
      prop.children.should_not be_empty
    end
    
  end
end
