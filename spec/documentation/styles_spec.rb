require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'entrance'

describe "Styles Tutorial" do
  uses_scene :documentation
  
  before(:each) do
    Entrance.cue scene, :editing_styles
  end
  
  it "should have a root walkthrough" do
    scene.find_by_name("walkthrough").should_not be_nil
  end
  
  it "should have a slideshow and at least one slide" do    
    slideshow = scene.find("slideshow")
    
    slides = slideshow.find_by_name("slide")
    
    slideshow.should_not be_nil
    slides.should_not be_empty
  end
end
