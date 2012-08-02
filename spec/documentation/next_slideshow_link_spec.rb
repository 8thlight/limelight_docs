require 'spec_helper'
require "walkthrough_link"
require "entrance"

# This test is excrutiatingly slow.  Why? EMS
describe "Documentation" do
  uses_scene :documentation

  it "should have a link to the next slideshow on the last slide of the current slideshow" do
    first = WalkthroughLink.all[0]
    second = WalkthroughLink.all[1]

    go_to_end_of_tutorial(first)

    next_slideshow = scene.find("next_slideshow")
    next_slideshow.should_not be_nil
    next_slideshow.name.should == "directions_tutorial_link"
    next_slideshow.toc_link_id.should == second.id
    next_slideshow.section_id.should == TocSection.section_for_walkthrough_id(second.id).name
  end

  it "should not have the link to the next slideshow for the last slideshow" do
    last = WalkthroughLink.all[-1]
    go_to_end_of_tutorial(last)

    next_slideshow = scene.find("next_slideshow")
    next_slideshow.should be_nil
  end

  def go_to_end_of_tutorial(tutorial)
    Entrance.cue_tutorial(scene, tutorial.slideshow, tutorial.title)
    current_slideshow = scene.find("slideshow")
    (current_slideshow.num_slides - 1).times { scene.find("next").mouse_clicked(nil) }
  end
end
