require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'slideshow'

describe "Slideshow" do
  
  before(:each) do
    @parent_prop = Limelight::Prop.new
    @prop1 = Limelight::Prop.new
    @prop2 = Limelight::Prop.new
    @parent_prop << @prop1 << @prop2
    
    @previous_button = Limelight::Prop.new
    @next_button = Limelight::Prop.new
  end
  
  describe "Two Slides in the slideshow" do
    before(:each) do
      @slideshow = Slideshow.new(@parent_prop, @previous_button, @next_button)
    end
    
    it "should make the next slide visible on next" do
      @slideshow.next

      @parent_prop.children.length.should == 1
      @parent_prop.children[0].should == @prop2
    end

    it "should halt at the end if you try to advance past it" do
      @slideshow.next
      @slideshow.next

      @parent_prop.children.length.should == 1
      @parent_prop.children[0].should == @prop2
    end

    it "should move backwards with previous" do
      @slideshow.next
      @slideshow.previous

      @parent_prop.children.length.should == 1
      @parent_prop.children[0].should == @prop1
    end

    it "should not move past 0" do
      @slideshow.next
      @slideshow.previous
      @slideshow.previous

      @parent_prop.children.length.should == 1
      @parent_prop.children[0].should == @prop1
    end
    
    it "should make the previous prop transparent on init" do
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
    end
    
    it "should hide the next button when it reaches the end of the slideshow" do
      @slideshow.next
      
      @next_button.style.transparency.should == "100%"
    end
    
    it "should show the next button on init" do
      @next_button.style.transparency.should == "0%"
    end
    
    it "should show the next button after going backwards again" do
      @slideshow.next
      @slideshow.previous
      
      @next_button.style.transparency.should == "0%"
    end
  end
  
  describe "Add a third Slide" do
    before(:each) do
      @prop3 = Limelight::Prop.new
      @parent_prop.add @prop3
      
      @slideshow = Slideshow.new(@parent_prop, @previous_button, @next_button)
    end
    
    it "should add the first prop to the slideshow, and remove all other props on creation" do
      @parent_prop.children.length.should == 1
      @parent_prop.children[0].should == @prop1
    end

    it "should remove all other props on moving" do
      @parent_prop.add @prop3
      
      @slideshow.next

      @parent_prop.children.length.should == 1
      @parent_prop.children[0].should == @prop2
    end
  end
end