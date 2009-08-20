require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'entrance'

describe "SandboxButton" do
  uses_scene :documentation
  
  before(:each) do
    Entrance.cue scene, :sandbox
    
    @canvas = scene.find('canvas')
    @code = scene.find('code')
    @sandbox_button = scene.find('sandbox_button')
  end
  
  it "should clear the canvas" do
    prop = Limelight::Prop.new
    @canvas << prop
    
    @sandbox_button.button_pressed(nil)
    
    @canvas.children.should_not include(prop)
  end
  
  it "should execute the text in the code prop" do
    @code.text = "prop :id => 'my_prop'"
    
    @sandbox_button.button_pressed(nil)
    
    scene.find('my_prop').should_not be_nil
  end
  
  it "should do error handling on the eval" do
    @code.text = "fjfjfj do"

    @sandbox_button.button_pressed(nil)
    
    scene.find('error').should_not be_nil
  end
  
  it "should display a prettied up error message" do
    @code.text = "fjfjfj do"
    
    @sandbox_button.button_pressed(nil)
    
    scene.find('error').text.should match(/^Syntax error: .*/)
    scene.find('error').text.should_not include("eval")
  end
  
end