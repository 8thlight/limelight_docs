require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'navigator'
 
describe "Walkthrough" do
 
  uses_scene :walkthrough
  
  describe "Next Button Clicked" do
    before(:each) do
      @prop = Limelight::Prop.new
      @navigator = mock(Navigator, :next => nil, :slide => @prop)
      scene.navigator = @navigator
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

    it "should handle when you have reached the end of the navigation" do
      @navigator.stub!(:slide).and_return(nil)

      lambda{scene.find("next").mouse_clicked(nil)}.should_not raise_error
      canvas = scene.find("canvas")
      canvas.children.should_not be_empty
    end
  end
end