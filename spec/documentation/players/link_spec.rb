require 'spec_helper'
require 'documentation/players/link'

class TestLink < Limelight::Prop
  attr_accessor :scene
  
  include Link
end


describe "Link" do
  before(:each) do
    @slideshow = mock("Slideshow")
    @slideshow.stub!(:next)
    
    @scene = mock("Scene", :find => @slideshow, :null_object => true)
    @link = TestLink.new
    @link.scene = @scene
    @link.stub!(:launch)    
  end
  
  it "should call launch when clicked on its url" do
    @link.url = "test url"
    @link.should_receive(:launch).with("test url")

    @link.mouse_clicked(nil)
  end

  it "should advance to the next scene" do
    @slideshow.should_receive(:next)
    @scene.should_receive(:find).with("slideshow").and_return(@slideshow)
  
    @link.mouse_clicked(nil)    
  end
end
