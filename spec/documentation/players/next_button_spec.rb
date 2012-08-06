require 'spec_helper'
require 'documentation/players/next_button'

class TestNextButton < Limelight::Prop
  attr_accessor :scene
  
  include NextButton
end

describe "Next Button" do
  it "should advance the slideshow" do
    scene = mock(Limelight::Scene).as_null_object
    next_button = TestNextButton.new
    next_button.scene = scene
    slideshow  = mock("Slideshow")
    
    scene.should_receive(:find).with("slideshow").and_return(slideshow)
    slideshow.should_receive(:next)
    
    next_button.mouse_clicked(nil)
  end
end
