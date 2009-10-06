require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "walkthrough_link"

describe WalkthroughLink do
  
  def check_link(id, slideshow, text, title=text) 
    link = WalkthroughLink.find(id)
    link.slideshow.should == slideshow
    link.text.should == text
    link.title.should == title
    WalkthroughLink.all.find {|l| l.id == link.id }.should_not be_nil
  end
  
  it "should have some basic information" do
    walkthrough_link = WalkthroughLink.new(:id => "some id", :text => "some text", :slideshow => "some slideshow", :title => "Some Title")
    walkthrough_link.id.should == "some id"
    walkthrough_link.text.should == "some text"
    walkthrough_link.slideshow.should == "some slideshow"
    walkthrough_link.title.should == "Some Title"
  end
  
  it "should have a 'getting started' link" do
    check_link("getting_started_walkthrough", "getting_started", "Getting Started")
  end
  
  it "should have a 'creating props' link" do
    check_link("creating_props_walkthrough", "creating_props", "Creating Props")
  end
  
  it "should have an styling text tutorial" do
    check_link("text_walkthrough", "text", "Text")
  end
  
  it "should have an prop partials tutorial" do
    check_link("prop_partials_walkthrough", "prop_partials", "Prop Partials")
  end

  it "should have an 'editing styles' link" do
    check_link("editing_styles_walkthrough", "editing_styles", "Editing Styles")
  end
  
  it "should have a 'prop layout' link" do
    check_link("prop_layout_walkthrough", "prop_layout", "Prop Layout")
  end
  
  it "should have a float tutorial" do
    check_link("float_walkthrough", "float", "Floating Props")
  end

  it "should have a 'prop sizing' link" do
    check_link("prop_sizing_walkthrough", "prop_sizing", "Sizing Props")
  end
  
  it "should have a 'colors' link" do
    check_link("colors_walkthrough", "colors", "Colors")
  end

  it "should have a 'backgrounds' link" do
    check_link("backgrounds_walkthrough", "backgrounds", "Backgrounds")
  end

  it "should have a 'gradients' link" do
    check_link("gradients_walkthrough", "gradients", "Gradients")
  end

  it "should have a 'borders' link" do
    check_link("borders_walkthrough", "borders", "Borders")
  end
  
  it "should have an Insets tutorial" do
    check_link("insets_walkthrough", "insets", "Margin and Padding", "Insets")
  end

  it "should have a 'players' link " do
    check_link("players_walkthrough", "players", "Players")
  end
  
  it "should have an 'images' link" do
    check_link("images_walkthrough", "images", "Images")
  end
  
  it "should have an 'animations' link" do
    check_link("animations_walkthrough", "animations", "Animations")
  end
  
  it "should have a sound tutorial" do
    check_link("sound_walkthrough", "sound", "Audio")
  end
    
  it "should have a 'productions' link" do
    check_link("productions_walkthrough", "productions", "Productions")
  end

  it "should have a 'stages' link" do
    check_link("stages_walkthrough", "stages", "Stages")
  end
  
  describe "next" do
    before(:each) do
      @first = WalkthroughLink.all[0]
      @second = WalkthroughLink.all[1]
      @third = WalkthroughLink.all[2]
      @last = WalkthroughLink.all[-1]
    end
    
    it "should find the second" do
      WalkthroughLink.next(@first.slideshow).slideshow.should == @second.slideshow
    end
    
    it "should find the third" do
      WalkthroughLink.next(@second.slideshow).slideshow.should == @third.slideshow
    end

    it "should return nil if the current walkthrough is the last" do
      WalkthroughLink.next(@last.slideshow).should be_nil
    end
    
    it "should return nil if the current slideshow doesn't exist" do
      WalkthroughLink.next("bad slideshow").should be_nil
    end
  end
end