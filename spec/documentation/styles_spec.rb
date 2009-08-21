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
    
    it "should apply to the prop specified in the style" do
      canvas = scene.find('canvas')
      my_prop = Limelight::Prop.new(:name => "my_prop", :id => "my_prop")
      my_prop.style.text_color = :blue
      canvas << my_prop
      
      @code_area.text = "my_prop { text_color :red }"
      @styles_sandbox_button.button_pressed(nil)
      
      prop = scene.find('my_prop')
      prop.style.text_color.should == "#ff0000ff"
    end
    
    it "should apply to all the props with that name" do
      canvas = scene.find('canvas')
      my_prop = Limelight::Prop.new(:name => "my_prop", :id => "my_prop")
      my_prop.style.text_color = :red
      canvas << my_prop
      my_prop2 = Limelight::Prop.new(:name => "my_prop", :id => "my_prop2")
      my_prop2.style.text_color = :green
      canvas << my_prop2
      
      @code_area.text = "my_prop { text_color :blue }"
      @styles_sandbox_button.button_pressed(nil)

      props = scene.find_by_name("my_prop")
      props[0].style.text_color.should == "#0000ffff"
      props[1].style.text_color.should == "#0000ffff"
    end
    
    it "should handle when the prop in the style isnt in the scene" do
      style_dsl = "my_prop { text_color :blue }"

      @code_area.text = style_dsl
      lambda{@styles_sandbox_button.button_pressed(nil)}.should_not raise_error
    end
    
    it "should only apply the styles to the children of the canvas" do
      my_prop = Limelight::Prop.new(:name => "my_prop", :id => "my_prop")
      my_prop.style.text_color = :red
      scene << my_prop
      
      @code_area.text = "my_prop { text_color :blue }"
      
      @styles_sandbox_button.button_pressed(nil)
      my_prop.style.text_color.should == "#ff0000ff"
    end
    
    it "should work properly if run twice - removing the screen then adding it" do
      canvas = scene.find('canvas')
      my_prop = Limelight::Prop.new(:name => "my_prop", :id => "my_prop")
      my_prop.style.text_color = :red
      canvas << my_prop
      
      @code_area.text = "my_prop { text_color :blue }"
      @styles_sandbox_button.button_pressed(nil)
      @code_area.text = "my_prop { text_color :red }"
      @styles_sandbox_button.button_pressed(nil)
      
      my_prop.style.text_color.should == "#ff0000ff"
    end
  end  
end
