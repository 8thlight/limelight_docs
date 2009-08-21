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
  
  it "should convert the text to a style - and apply it to the object" do
    slideshow = scene.find('slideshow')
    slideshow.next
    slideshow.next
    
    styles_sandbox_button = scene.find("run_styles_button")
    code_area = scene.find('code')

    style_dsl =<<END
    prop {
      text_color :blue
    }
END
    
    code_area.text = style_dsl
    styles_sandbox_button.button_pressed(nil)
    
    prop = scene.find("test_prop")
    prop.style.text_color.should == "#0000ffff"
  end
end
