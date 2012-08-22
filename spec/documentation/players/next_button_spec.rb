require 'spec_helper'

describe "Next Button" do

  uses_limelight :scene_path => "documentation" do
    next_button :id => "next"
  end

  it "should advance the slideshow" do
    next_button = scene.find("next")
    slideshow  = mock("Slideshow")
    slideshow.stub!(:next)
    scene.stub!(:find)
    
    scene.should_receive(:find).with("slideshow").and_return(slideshow)
    slideshow.should_receive(:next)
    
    mouse.click next_button
  end
end
