require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'navigator'
 
describe "Walkthrough" do
 
  uses_scene :walkthrough
  
  it "should get the next prop from the navigator" do
    navigator = mock(Navigator)
    scene.navigator = navigator
    
    navigator.should_receive(:next)
    scene.find("next").mouse_clicked(nil)
  end
end