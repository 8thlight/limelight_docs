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
  
  describe "Style Sandbox" do
    before(:each) do
      slideshow = scene.find('slideshow')
      slideshow.next
      slideshow.next
      
      @styles_sandbox_button = scene.find("run_styles_button")
      @code_area = scene.find('code')
    end
    
    it "should convert the text to a style - and apply it to the object" do
      @code_area.text = "prop { text_color :blue }"
      @styles_sandbox_button.button_pressed(nil)

      prop = scene.find("test_prop")
      prop.style.text_color.should == "#0000ffff"
    end
    
    it "should apply to the prop specified in the style and nothing else" do
      @code_area.text = "my_prop { text_color :red }"
      @styles_sandbox_button.button_pressed(nil)
      
      prop = scene.find('test_prop')
      prop.style.text_color.should == "#000000ff"
    end
        
    it "should handle when the prop in the style isnt in the scene" do
      style_dsl = "my_prop { text_color :blue }"

      @code_area.text = style_dsl
      lambda{@styles_sandbox_button.button_pressed(nil)}.should_not raise_error
    end
    
    it "should only apply the styles to the children of the canvas" do
      @code_area.text = "code { text_color :blue }"
      
      @styles_sandbox_button.button_pressed(nil)
      code_prop = scene.find_by_name("code")[0]
      code_prop.style.text_color.should == "#000000ff"
    end
    
    it "should work properly if run twice - removing the styles then adding them" do
      @code_area.text = "prop { text_color :blue }"
      @styles_sandbox_button.button_pressed(nil)
      @code_area.text = "prop { text_color :red }"
      @styles_sandbox_button.button_pressed(nil)
      
      test_prop = scene.find('test_prop')
      test_prop.style.text_color.should == "#ff0000ff"
    end
  end  
end
