require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "walkthrough_link"
require 'rdoc_loader'

describe "Documentation" do
  it_should_behave_like "all documentation scenes"
  
  before(:each) do
    link = WalkthroughLink.new(:id => "some id", :text => "some text", :slideshow => "some slideshow", :title => "Some Title")
    WalkthroughLink.stub!(:all).and_return([link])
  end
  
  uses_scene :documentation
  
  describe "Loading RDoc" do
    it "should load the RDoc with the RDoc loader" do
      loader = mock(RDocLoader)
      RDocLoader.should_receive(:new).and_return(loader)
      loader.should_receive(:load)
      
      cast_scene
    end
    
    def cast_scene
      scene
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
