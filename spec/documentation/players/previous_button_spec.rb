require 'spec_helper'

describe "Previous Button Clicked" do
  
  uses_limelight :scene_path => "documentation" do
    previous_button :id => "previous"
  end
  
  it "should reverse the slide show" do
    prev_button = scene.find("previous")
    slideshow  = mock("Slideshow")
    slideshow.stub!(:previous)
    scene.stub!(:find)

    scene.should_receive(:find).with("slideshow").and_return(slideshow)
    slideshow.should_receive(:previous)
    
    mouse.click prev_button
  end
end
