require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'slideshow'
 
describe "Walkthrough" do
  uses_scene :walkthrough
  
  before(:each) do
    @slideshow = mock(Slideshow, :slide => @prop)
    Slideshow.stub!(:new).and_return(@slideshow)
  end
  
  describe "Previous and Next Buttons" do
    before(:each) do
      @prop = Limelight::Prop.new
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
  
  describe "Link" do
    before(:each) do
      @link = scene.find_by_name("link")[0]
      @link.stub!(:launch)
      @slideshow.stub!(:next)
    end
    
    it "should call launch when clicked on its url" do
      @link.url = "test url"
      @link.should_receive(:launch).with("test url")

      @link.mouse_clicked(nil)
    end

    it "should advance to the next scene" do
      scene.should_receive(:advance)
    
      @link.mouse_clicked(nil)    
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