require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'slideshow'
 
describe "Walkthrough" do
  uses_scene :walkthrough
  
  describe "Previous and Next Buttons" do
    before(:each) do
      @prop = Limelight::Prop.new
      @slideshow = mock(Slideshow, :slide => @prop)
      scene.slideshow = @slideshow
    end

    describe "Next Button Clicked" do
      before(:each) do
        @slideshow.stub!(:next)
      end

      it "should advance the naviagtor" do
        @slideshow.should_receive(:next)
        scene.find("next").mouse_clicked(nil)
      end
    end

    describe "Previous Button Clicked" do
      before(:each) do
        @slideshow.stub!(:previous)
      end

      it "should reverse the slide show" do
        @slideshow.should_receive(:previous)

        scene.find("previous").mouse_clicked(nil)
      end
    end
  end

# It is 8/17/09.  If the verify button doesn't come back in a week or two - delete these specs and the corresponding prop 
#  describe "Verify Button Clicked" do
#    before(:each) do
#      @jruby_button = scene.find("verify_jruby")
#    end
    
#    it "should verify that jruby is in the path based on jruby -v" do
#      @jruby_button.should_receive(:system).with("jruby -v").and_return(true)

#      @jruby_button.mouse_clicked(nil)
#    end
    
#    it "should set the button text to FAILED if the jruby -v doesn't work" do
#      @jruby_button.stub!(:system).and_return(false)
      
#      @jruby_button.mouse_clicked(nil)
      
#      @jruby_button.text.should == "ERROR"
#    end
    
#    it "should set the button text to SUCCESS if the jruby -v does execute" do
#      @jruby_button.stub!(:system).and_return(true)
      
#      @jruby_button.mouse_clicked(nil)
      
#      @jruby_button.text.should == "SUCCESS"
#    end
#  end
end