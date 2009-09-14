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
      @slideshow = scene.find('slideshow')
      @slideshow.next
      @slideshow.next
      
      @styles_sandbox_button = scene.find("sandbox_button")
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
    
    it "should apply to all the props - not just one" do
      @slideshow.next
      @slideshow.next
      @slideshow.next
      @slideshow.next
      
      @code_area = scene.find('code')
      @code_area.text = "green_prop { text_color :blue }"
      @styles_sandbox_button.button_pressed(nil)
      
      props = scene.find_by_name('green_prop')
      props[0].style.text_color.should == "#0000ffff"
      props[1].style.text_color.should == "#0000ffff"
    end
    
    it "should not apply to the canvas" do
      @code_area.text = "canvas {text_color :blue}"
      @styles_sandbox_button.button_pressed(nil)
      
      prop = scene.find_by_name("canvas")[0]
      prop.style.text_color.should_not == "#0000ffff"
    end
    
    it "should set the text to the error message if the style is invalid" do
      @code_area.text = "canvas {monkey_butler :red}"
      @styles_sandbox_button.button_pressed(nil)
      
      prop = scene.find('canvas')
      
      error = prop.children.last
      error.text.should == "'monkey_butler' is not a valid style"
    end
    
    it "should clear out the error child if it exists" do
      @code_area.text = "canvas {monkey_butler :red}"
      @styles_sandbox_button.button_pressed(nil)
      @code_area.text = "canvas {text_color :blue}"
      @styles_sandbox_button.button_pressed(nil)
      
      scene.find('canvas').find_by_name("style_error").should be_empty
    end
  end  
end
