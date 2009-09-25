require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "walkthrough_link"
require 'rdoc_loader'
require 'documentation/players/documentation'

describe "Documentation" do
  before(:each) do
    link = WalkthroughLink.new(:id => "some id", :text => "some text", :slideshow => "some slideshow", :title => "Some Title")
    WalkthroughLink.stub!(:all).and_return([link])
    stub_doc_loader
  end
  
  uses_scene :documentation
  
  describe "Loading RDoc" do
    before(:each) do
      @loader = mock(RDocLoader, :load => nil)
      @thread = mock(Thread, :priority= => nil)
      Thread.stub!(:new).and_yield("scene").and_return(@thread)
      RDocLoader.stub!(:new).and_return(@loader)
      scene
    end
        
    it "should load the RDoc with the RDoc loader" do
      RDocLoader.should_receive(:new).with("scene").and_return(@loader)
      @loader.should_receive(:load)
      
      scene.scene_opened(nil)
    end
    
    it "should run it all in a thread" do
      Thread.should_receive(:new).ordered.and_yield("i dont care yet")
      RDocLoader.should_receive(:new).ordered.and_return(@loader)
      
      scene.scene_opened(nil)
    end
    
    it "should set the thread priority to -1000" do
      @thread.should_receive(:priority=).with(Documentation::THREAD_PRIORITY)
      
      scene.scene_opened(nil)
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
