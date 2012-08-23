require 'spec_helper'

class ProgressObserver
  def observe
  end
end

describe "Slideshow" do

  uses_limelight :scene_path => "documentation" do
    __install "documentation/common/navigation_buttons.rb", :title => "Some Title"
    slideshow :id => "slideshow" do
      prop :id => "prop1"
      prop :id => "prop2"
      prop :id => "prop3"
    end
  end
  
  before(:each) do
    @slideshow = scene.find("slideshow")
    @previous_button = scene.find("previous")
    @next_button = scene.find("next")
  end
  
  describe "Two Slides in the slideshow" do
    
    it "should know number of slides" do
      @slideshow.num_slides.should == 3
    end
    
    it "should know the current slide" do
      @slideshow.current_slide_number.should == 1
    end
    
    it "should make the next slide visible on next" do
      @slideshow.next
      
      @slideshow.children.length.should == 1
      @slideshow.children[0].should == scene.find("prop2")
    end

    it "should halt at the end if you try to advance past it" do
      @slideshow.next
      @slideshow.next
      @slideshow.next
  
      @slideshow.children.length.should == 1
      @slideshow.children[0].should == scene.find("prop3")
    end
  
    it "should move backwards with previous" do
      @slideshow.next
      @slideshow.previous
  
      @slideshow.children.length.should == 1
      @slideshow.children[0].should == scene.find("prop1")
    end
  
    it "should not move past 0" do
      @slideshow.next
      @slideshow.previous
      @slideshow.previous
  
      @slideshow.children.length.should == 1
      @slideshow.children[0].should == scene.find("prop1")
    end
    
    it "should make the previous button prop transparent on casting" do
      @previous_button.style.transparency.should == "100%"
    end
    
    it "should show the previous prop when it is available" do
      @slideshow.next
      
      @previous_button.style.transparency.should == "0%"
    end
    
    it "should hide the previous prop when it is no longer available" do
      @slideshow.next
      @slideshow.previous
      
      @previous_button.style.transparency.should == "100%"
      @previous_button.hover_style.extentions.should be_empty
    end
    
    it "should hide the next button when it reaches the end of the slideshow" do
      @slideshow.next
      @slideshow.next
      
      @next_button.style.transparency.should == "100%"
      @next_button.hover_style.extentions.should be_empty
    end
    
    it "should show the next button on init" do
      @next_button.style.transparency.should == "0%"
    end
    
    it "should show the next button after going backwards again" do
      @slideshow.next
      @slideshow.next
      @slideshow.previous
      
      @next_button.style.transparency.should == "0%"
    end
    
    #it "should not crash if there are no slides" do
    #  @slideshow = TestSlideshow.new
    #  @slideshow.scene = @scene
    #  
    #  lambda{@slideshow.casted}.should_not raise_error
    #end
  end
  
  describe "progress observers" do
    before(:each) do
      @observer = ProgressObserver.new
      @slideshow.register_progress_observer(@observer)
    end

    it "should notify progress observers on next" do
      @observer.should_receive(:observe)
      
      @slideshow.next
    end
    
    it "should notify progress observers on previous" do
      @slideshow.next
      @observer.should_receive(:observe)
      
      @slideshow.previous
    end
    
    it "should not notify the observers if the slideshow is at the beginning and previous is pressed" do
      @observer.should_not_receive(:observe)
      
      @slideshow.previous
    end

    it "should not notify the observers if the slideshow is at the end and next is pressed" do
      @slideshow.next
      @slideshow.next
      @observer.should_not_receive(:observe)
      
      @slideshow.next
    end
  end
end
