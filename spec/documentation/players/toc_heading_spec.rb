require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "TocHeading" do
  uses_scene :documentation

  describe "clicking rdoc" do
    before(:each) do
      @rdoc_link = scene.find("RDoc")
      @rdoc_link.mouse_clicked(nil)
    end

    it "should select the rdoc" do
      @rdoc_link.style.has_extension(@rdoc_link.selected_style).should be_true
    end
  
    it "should remove the unselected stye from the rdoc" do
      @rdoc_link.style.has_extension(@rdoc_link.unselected_style).should be_false
    end
  
    it "should add the unselected_toc_heading to walkthrough" do
      scene.find("Walkthrough").style.has_extension(@rdoc_link.unselected_style).should be_true
    end
    
    it "should remove the selected from walkthrough" do
      scene.find("Walkthrough").style.has_extension(@rdoc_link.selected_style).should be_false
    end
  end
  
  describe "clicking rdoc then clicking walkthrough" do
    before(:each) do
      @rdoc_link = scene.find("RDoc")
      @rdoc_link.mouse_clicked(nil)
      @walkthrough = scene.find("Walkthrough")
      @walkthrough.mouse_clicked(nil)
    end
    
    it "should unselect the rdoc" do
      @rdoc_link.style.has_extension(@rdoc_link.unselected_style).should be_true
    end

    it "should unselect the rdoc" do      
      @walkthrough.style.has_extension(@rdoc_link.selected_style).should be_true
    end
  end
  
  describe "Hiding/Showing tab content" do
    it "should " do
      
    end
  end

end