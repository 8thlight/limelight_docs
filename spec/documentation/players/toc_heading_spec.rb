require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "TocHeading" do
  uses_scene :documentation
  before(:each) do
    @rdoc_link = scene.find("RDoc")
    @rdoc_link.mouse_clicked(nil)
  end

  describe "clicking rdoc" do
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
  
  describe "Showing RDoc Content" do
    before(:each) do
      @toc_links = scene.find('toc_links')
    end
    
    it "should install the rdoc links when clicked" do
      @toc_links.find_by_name('class_link').should_not be_empty
    end
    
    it "should should not have any walkthrough links" do
      @toc_links.find_by_name('toc_link').should be_empty
    end
    
    it "should reinstall the walkthrough links when you click walkthrough" do
      @walkthrough = scene.find("Walkthrough")
      @walkthrough.mouse_clicked(nil)
      
      @toc_links.find_by_name('toc_link').should_not be_empty
    end
  end

end