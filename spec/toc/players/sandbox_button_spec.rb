require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'toc/players/sandbox_button'

class TestSandboxButton < Limelight::Prop  
  include SandboxButton
end


describe "SandboxButton" do
  before(:each) do
    @scene = mock("Scene", :find => @slideshow, :null_object => true)
    @sandbox_button = TestSandboxButton.new
    @sandbox_button.scene = @scene
  end
  
  # it "should call launch when clicked on its url" do
  #   @link.url = "test url"
  #   @link.should_receive(:launch).with("test url")
  # 
  #   @link.mouse_clicked(nil)
  # end
  # 
  # it "should advance to the next scene" do
  #   @slideshow.should_receive(:next)
  #   @scene.should_receive(:find).with("slideshow").and_return(@slideshow)
  # 
  #   @link.mouse_clicked(nil)    
  # end
end