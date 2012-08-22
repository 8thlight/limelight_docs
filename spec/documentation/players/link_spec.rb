require 'spec_helper'

describe "Link" do

  uses_limelight :scene_path => "documentation" do
    prop :id => "previous"
    prop :id => "next"
    slideshow :id => "slideshow"
    link :id => "link"
  end

  before(:each) do
    @slideshow = scene.find("slideshow")
    @slideshow.stub!(:next)
    
    @link = scene.find("link")
    @link.stub!(:launch)    
  end
  
  it "should call launch when clicked on its url" do
    @link.url = "test url"
    @link.should_receive(:launch).with("test url")

    mouse.click @link
  end

  it "should advance to the next scene" do
    @slideshow.should_receive(:next)
    scene.should_receive(:find).with("slideshow").and_return(@slideshow)
  
    mouse.click @link
  end
end
