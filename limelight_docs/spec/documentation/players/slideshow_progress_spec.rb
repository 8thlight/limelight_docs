require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'documentation/players/slideshow_progress'

describe SlideshowProgress do
  uses_limelight :scene_path => "documentation" do
    __install "documentation/common/navigation_buttons.rb", :title => "Some Title"
    slideshow :id => "slideshow"
    slideshow_progress :id => "progress" do
      progress_bar :id => "progress_bar", :width => "0%"
      progress_text :id => "progress_text"
    end
  end
  
  def progress_prop
    scene.find("progress")
  end
  
  before(:each) do
    @slideshow_prop = scene.find("slideshow")
  end

  it "should include the total number of slides in the text after update" do
    @slideshow_prop.stub!(:num_slides).and_return(6)

    progress_prop.update_content
    
    scene.find("progress_text").text.should match(/6/)
  end
  
  it "should include the current slide number on update_content" do
    @slideshow_prop.stub!(:current_slide_number).and_return(3)

    progress_prop.update_content
    
    scene.find("progress_text").text.should match(/3/)
  end
  
  it "should update the num_slides on observe" do
    @slideshow_prop.stub!(:num_slides).and_return(6)

    progress_prop.observe
    
    scene.find("progress_text").text.should match(/6/)
  end

  it "should include the current slide number on observe" do
    @slideshow_prop.stub!(:current_slide_number).and_return(3)

    progress_prop.update_content
    
    scene.find("progress_text").text.should match(/3/)
  end
  
  it "should update the width to 50%" do
    @slideshow_prop.stub!(:current_slide_number).and_return(5)
    @slideshow_prop.stub!(:num_slides).and_return(10)
    
    progress_prop.update_content
    
    scene.find("progress_bar").style.width.should == "50%"
  end
  
  it "should update the width to 70%" do
    @slideshow_prop.stub!(:current_slide_number).and_return(7)
    @slideshow_prop.stub!(:num_slides).and_return(10)
    
    progress_prop.update_content
    
    scene.find("progress_bar").style.width.should == "70%"
  end
  
end