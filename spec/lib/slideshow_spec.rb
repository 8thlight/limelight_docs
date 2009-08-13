require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'slideshow'

describe "Slideshow" do
  
  before(:each) do
    @prop1 = Limelight::Prop.new
    @prop2 = Limelight::Prop.new
    
    @slideshow = Slideshow.new([@prop1, @prop2])
  end
    
  it "should make the next slide visible on next" do
    @slideshow.next
    
    @prop1.style.transparency.should == "100%"
    @prop2.style.transparency.should == "0%"
  end
  
  it "should halt at the end if you try to advance past it" do
    @slideshow.next
    @slideshow.next
    
    @prop1.style.transparency.should == "100%"
    @prop2.style.transparency.should == "0%"
  end
  
  it "should move backwards with previous" do
    @slideshow.next
    @slideshow.previous
    
    @prop1.style.transparency.should == "0%"
    @prop2.style.transparency.should == "100%"
  end
  
  it "should not move past 0" do
    @slideshow.next
    @slideshow.previous
    @slideshow.previous
    
    @prop1.style.transparency.should == "0%"
    @prop2.style.transparency.should == "100%"
  end
  
  it "should set the first prop to visible, and all other props to invisible on creation" do
    prop1 = Limelight::Prop.new
    prop2 = Limelight::Prop.new
    prop3 = Limelight::Prop.new
    
    @slideshow = Slideshow.new([prop1, prop2, prop3])
    
    prop1.style.transparency.should == "0%"
    prop2.style.transparency.should == "100%"
    prop3.style.transparency.should == "100%"
  end
  
  it "should set all props to invisible on moving" do
    prop1 = Limelight::Prop.new
    prop2 = Limelight::Prop.new
    prop3 = Limelight::Prop.new
    
    @slideshow = Slideshow.new([prop1, prop2, prop3])
    prop3.style.transparency = "0%"
    
    @slideshow.next
    
    prop3.style.transparency.should == "100%"
  end
end