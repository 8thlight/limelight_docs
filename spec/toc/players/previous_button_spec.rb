require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'toc/players/previous_button'

class TestPreviousButton < Limelight::Prop
  attr_accessor :scene
  
  include PreviousButton
end


describe "Previous Button Clicked" do
  
  
  before(:each) do
    @slideshow.stub!(:previous)
  end

  it "should reverse the slide show" do
    scene = mock(Limelight::Scene, :null_object => true)
    prev_button = TestPreviousButton.new
    prev_button.scene = scene
    slideshow  = mock("Slideshow")
    
    scene.should_receive(:find).with("slideshow").and_return(slideshow)
    slideshow.should_receive(:previous)
    
    prev_button.mouse_clicked(nil)
  end
end