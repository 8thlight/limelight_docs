require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'documentation/players/slideshow'

class TestSlideshow < Limelight::Prop
  attr_accessor :scene
  
  include Slideshow
  
end

class ProgressObserver
  def observe
  end
end

describe "Slideshow" do
  
  before(:each) do
    @slideshow = TestSlideshow.new
    
    @prop1 = Limelight::Prop.new
    @prop2 = Limelight::Prop.new
    @prop3 = Limelight::Prop.new
    @slideshow << @prop1 << @prop2 << @prop3
    
    @previous_button = Limelight::Prop.new
    @next_button = Limelight::Prop.new
    @styles = mock("style hash", :[] => nil)
    @scene = mock(Limelight::Scene, :styles => @styles, :null_object => true)
    @scene.stub!(:find).with("previous").and_return(@previous_button)
    @scene.stub!(:find).with("next").and_return(@next_button)
    @slideshow.scene = @scene
    
    @previous_button.hover_style = "some style"
    @next_button.hover_style = "some style"
    
    @slideshow.casted
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
      @slideshow.children[0].should == @prop2
    end

    it "should halt at the end if you try to advance past it" do
      @slideshow.next
      @slideshow.next
      @slideshow.next
  
      @slideshow.children.length.should == 1
      @slideshow.children[0].should == @prop3
    end
  
    it "should move backwards with previous" do
      @slideshow.next
      @slideshow.previous
  
      @slideshow.children.length.should == 1
      @slideshow.children[0].should == @prop1
    end
  
    it "should not move past 0" do
      @slideshow.next
      @slideshow.previous
      @slideshow.previous
  
      @slideshow.children.length.should == 1
      @slideshow.children[0].should == @prop1
    end
    
    it "should make the previous button prop transparent on casting" do
      @previous_button.style.transparency.should == "100%"
    end
    
    it "should show the previous prop when it is available" do
      @styles.should_receive(:[]).with("previous_button.hover").and_return("hover style")
      @slideshow.next
      
      @previous_button.style.transparency.should == "0%"
      @previous_button.hover_style.should == "hover style"
    end
    
    it "should hide the previous prop when it is no longer available" do
      @slideshow.next
      @slideshow.previous
      
      @previous_button.style.transparency.should == "100%"
      @previous_button.hover_style.should == nil
    end
    
    it "should hide the next button when it reaches the end of the slideshow" do
      @slideshow.next
      @slideshow.next
      
      @next_button.style.transparency.should == "100%"
      @next_button.hover_style.should == nil
    end
    
    it "should show the next button on init" do
      @next_button.style.transparency.should == "0%"
    end
    
    it "should show the next button after going backwards again" do
      @slideshow.next
      @slideshow.next
      @styles.should_receive(:[]).with("next_button.hover").and_return("hover style")
      @slideshow.previous
      
      @next_button.style.transparency.should == "0%"
      @next_button.hover_style.should == "hover style"
    end
    
    it "should not crash if there are no slides" do
      @slideshow = TestSlideshow.new
      @slideshow.scene = @scene
      
      lambda{@slideshow.casted}.should_not raise_error
    end
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
      @observer.should_receive(:observe)
      
      @slideshow.previous
    end
  end
end