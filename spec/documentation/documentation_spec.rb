require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "walkthrough_link"

describe "Documentation" do
  before(:each) do
    link = WalkthroughLink.new(:id => "some id", :text => "some text", :slideshow => "some slideshow", :title => "Some Title")
    WalkthroughLink.stub!(:all).and_return([link])
    @limelight_rdoc = mock(LimelightRDoc::LimelightRDoc, :props_from => nil)
    LimelightRDoc::LimelightRDoc.stub!(:new).and_return(@limelight_rdoc)
  end
  
  uses_scene :documentation
  
  describe "Loading RDoc" do

    it "should load the props from $LIMELIGHT_LIB on production_loaded" do
      @limelight_rdoc.should_receive(:props_from).with($LIMELIGHT_LIB)
      
      scene.casted
    end
    
    it "should store the loaded props in rdoc" do
      @limelight_rdoc.stub!(:props_from).and_return("Type doesnt matter")

      scene.casted

      scene.rdoc.should == "Type doesnt matter"
    end
    
  end
  
  describe "toc_categories" do
    it "should have the walkthrough tutorial initially selected" do
      walkthrough = scene.find('Walkthrough')
      
      walkthrough.style.has_extension(scene.styles['selected_toc_heading']).should be_true
      walkthrough.style.has_extension(scene.styles['left_toc_heading']).should be_true
    end
    
    it "should have the rdoc section initially unselected " do
      rdoc = scene.find('RDoc')
      
      rdoc.style.has_extension(scene.styles['disabled_toc_heading']).should be_true
      rdoc.style.has_extension(scene.styles['right_toc_heading']).should be_true
    end
  end

  describe "table of contents links" do
    it "should have a 'getting started' link" do
      link = scene.find("some id")
      link.should_not be_nil
      
      link.slideshow.should == "some slideshow"
      link.text.should == "some text"
      link.title.should == "Some Title"
      link.toc_link_id.should == "some id"
    end
  end
end
