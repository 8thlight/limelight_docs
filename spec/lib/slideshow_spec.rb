require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'slideshow'

describe "Slideshow" do
  
  before(:each) do
    @prop1 = Limelight::Prop.new
    @prop2 = Limelight::Prop.new
    
    @slideshow = Slideshow.new([@prop1, @prop2])
  end
  
  it "should return the current slide" do
    @slideshow.slide.should == @prop1
  end
  
  it "should advance to the next slide" do
    @slideshow.next
    @slideshow.slide.should == @prop2
  end
  
  it "should halt at the end if you try to advance past it" do
    @slideshow.next
    @slideshow.next
    @slideshow.slide.should == @prop2
  end
  
  it "should move backwards with previous" do
    @slideshow.next
    @slideshow.previous
    
    @slideshow.slide.should == @prop1
  end
  
  it "should not move past 0" do
    @slideshow.next
    @slideshow.previous
    @slideshow.previous
    
    @slideshow.slide.should == @prop1
  end
end