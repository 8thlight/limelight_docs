require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'slideshow'
 
describe "Walkthrough" do
 
  uses_scene :walkthrough
  
  before(:each) do
    @prop = Limelight::Prop.new
    @slideshow = mock(Slideshow, :slide => @prop)
    scene.slideshow = @slideshow
  end
  
  describe "Next Button Clicked" do
    before(:each) do
      @slideshow.stub!(:next)
    end
    
    it "should advance the naviagtor" do
      @slideshow.should_receive(:next)
      scene.find("next").mouse_clicked(nil)
    end
  end
  
  describe "Previous Button Clicked" do
    before(:each) do
      @slideshow.stub!(:previous)
    end
    
    it "should reverse the slide show" do
      @slideshow.should_receive(:previous)
      
      scene.find("previous").mouse_clicked(nil)
    end
  end
  
  describe "Link Clicked" do
    
    it "should call our new fancy method openURL with the url" do
      link = scene.find("link")
      
      something.should_receive(:openURL).with("www.link.com")
      
      link.mouse_clicked(nil)
    end
    
  end
end