require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'documentation/players/slideshow_progress'

describe SlideshowProgress do
  uses_limelight :scene_path => "documentation" do
    __install "documentation/common/navigation_buttons.rb", :title => "Some Title"
    slideshow :id => "slideshow"
    slideshow_progress :id => "progress"
  end
  
  it "should include the total number of slides in the text after update" do
    slideshow_prop = scene.find("slideshow")
    slideshow_prop.stub!(:num_slides).and_return(6)

    scene.find("progress").update_content
    
    scene.find("progress").text.should match(/6/)
  end
  
  it "should include the current slide number on update_content" do
    slideshow_prop = scene.find("slideshow")
    slideshow_prop.stub!(:current_slide_number).and_return(3)

    scene.find("progress").update_content
    
    scene.find("progress").text.should match(/3/)
  end
  
  it "should update the num_slides on observe" do
    slideshow_prop = scene.find("slideshow")
    slideshow_prop.stub!(:num_slides).and_return(6)

    scene.find("progress").observe
    
    scene.find("progress").text.should match(/6/)
  end

  it "should include the current slide number on observe" do
    slideshow_prop = scene.find("slideshow")
    slideshow_prop.stub!(:current_slide_number).and_return(3)

    scene.find("progress").update_content
    
    scene.find("progress").text.should match(/3/)
  end
end