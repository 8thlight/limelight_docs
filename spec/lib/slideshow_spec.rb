require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'slideshow'

describe "Slideshow" do
  
  before(:each) do
    @parent_prop = Limelight::Prop.new
    @prop1 = Limelight::Prop.new
    @prop2 = Limelight::Prop.new
    @parent_prop << @prop1 << @prop2
  end
  
  describe "Two Slides in the slideshow" do
    before(:each) do
      @slideshow = Slideshow.new(@parent_prop)
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
    
    it "should start with has_previous to false" do
      @slideshow.has_previous?.should be_false
    end
    
    it "should have a previous once the slideshow has advanced" do
      @slideshow.next
      @slideshow.has_previous?.should be_true
    end
    
    it "should have a next when the slideshow has not moved" do
      @slideshow.has_next?.should be_true
    end
    
    it "should not have a next when the slideshow moves to the end" do
      @slideshow.next
      @slideshow.has_next?.should be_false
    end
    
  end
  
  describe "Add a third Slide" do
    before(:each) do
      @prop3 = Limelight::Prop.new
      @parent_prop.add @prop3
      
      @slideshow = Slideshow.new(@parent_prop)
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