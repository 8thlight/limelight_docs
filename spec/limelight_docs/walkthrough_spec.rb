require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'navigator'
 
describe "Walkthrough" do
 
  uses_scene :walkthrough
  
  before(:each) do
    @prop = Limelight::Prop.new
    @navigator = mock(Navigator, :slide => @prop)
    scene.navigator = @navigator
  end
  
  describe "Next Button Clicked" do
    before(:each) do
      @navigator.stub!(:next)
    end
    
    it "should advance the naviagtor" do
      @navigator.should_receive(:next)
      scene.find("next").mouse_clicked(nil)
    end

    it "should replace the prop(s) underneath canvas with the prop the navigator returns" do
      @navigator.stub!(:slide).and_return(@prop)

      scene.find("next").mouse_clicked(nil)

      canvas = scene.find("canvas")
      canvas.children.should == [@prop]
    end

    it "should call next before asking for the slide" do
      @navigator.should_receive(:next).ordered
      @navigator.should_receive(:slide).ordered.and_return(@prop)

      scene.find("next").mouse_clicked(nil)
    end
  end
  
  describe "Previous Button Clicked" do
    before(:each) do
      @navigator.stub!(:previous)
    end
    
    it "should reverse the slide show" do
      @navigator.should_receive(:previous)
      
      scene.find("previous").mouse_clicked(nil)
    end
    
    it "should replace the props underneath the canvas with those in the navigator" do
      @navigator.stub!(:slide).and_return(@prop)

      scene.find("previous").mouse_clicked(nil)

      canvas = scene.find("canvas")
      canvas.children.should == [@prop]
    end
  end
end