require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "walkthrough_link"
require "entrance"

describe "Documentation" do
  uses_scene :documentation
  
  it "should have a link to the next slideshow on the last slide of the current slideshow" do
    first = WalkthroughLink.all[0]
    second = WalkthroughLink.all[1]
    
    Entrance.cue_tutorial(scene, first.slideshow, first.title)
    11.times { scene.find("next").mouse_clicked(nil) }

    pending
  end
end