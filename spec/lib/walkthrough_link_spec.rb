require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "walkthrough_link"

describe WalkthroughLink do
  
  def check_link(id, slideshow, text, title=text)    
    @link.slideshow.should == slideshow
    @link.text.should == text
    @link.title.should == title
  end
  
  it "should have some basic information" do
    walkthrough_link = WalkthroughLink.new(:id => "some id", :text => "some text", :slideshow => "some slideshow", :title => "Some Title")
    walkthrough_link.id.should == "some id"
    walkthrough_link.text.should == "some text"
    walkthrough_link.slideshow.should == "some slideshow"
    walkthrough_link.title.should == "Some Title"
  end
  
  it "should have a 'getting started' link" do
    @link = WalkthroughLink.all[0]
    check_link("getting_started_walkthrough", "getting_started", "Getting Started")
  end
  
  it "should have a 'creating props' link" do
    @link = WalkthroughLink.all[1]
    check_link("creating_props_walkthrough", "creating_props", "Creating Props")
  end
  
  it "should have an styling text tutorial" do
    @link = WalkthroughLink.all[2]
    check_link("text_walkthrough", "text", "Text")
  end
  
  it "should have an prop partials tutorial" do
    @link = WalkthroughLink.all[3]
    check_link("prop_partials_walkthrough", "prop_partials", "Prop Partials")
  end

  it "should have an 'editing styles' link" do
    @link = WalkthroughLink.all[4]
    check_link("editing_styles_walkthrough", "editing_styles", "Editing Styles")
  end
  
  it "should have a 'prop layout' link" do
    @link = WalkthroughLink.all[5]
    check_link("prop_layout_walkthrough", "prop_layout", "Prop Layout")
  end
  
  it "should have a float tutorial" do
    @link = WalkthroughLink.all[6]
    check_link("float_walkthrough", "float", "Floating Props")
  end

  it "should have a 'prop sizing' link" do
    @link = WalkthroughLink.all[7]
    check_link("prop_sizing_walkthrough", "prop_sizing", "Prop Sizing")
  end
  
  it "should have a 'colors' link" do
    @link = WalkthroughLink.all[8]
    check_link("colors_walkthrough", "colors", "Colors")
  end

  it "should have a 'backgrounds' link" do
    @link = WalkthroughLink.all[9]
    check_link("backgrounds_walkthrough", "backgrounds", "Backgrounds")
  end

  it "should have a 'gradients' link" do
    @link = WalkthroughLink.all[10]
    check_link("gradients_walkthrough", "gradients", "Gradients")
  end

  it "should have a 'borders' link" do
    @link = WalkthroughLink.all[11]
    check_link("borders_walkthrough", "borders", "Borders")
  end
  
  it "should have an Insets tutorial" do
    @link = WalkthroughLink.all[12]
    check_link("insets_walkthrough", "insets", "Margin and Padding", "Insets")
  end

  it "should have a 'players' link " do
    @link = WalkthroughLink.all[13]
    check_link("players_walkthrough", "players", "Players")
  end
  
  it "should have an 'images' link" do
    @link = WalkthroughLink.all[14]
    check_link("images_walkthrough", "images", "Images")
  end
  
  it "should have an 'animations' link" do
    @link = WalkthroughLink.all[15]
    check_link("animations_walkthrough", "animations", "Animations")
  end
  
  it "should have a sound tutorial" do
    @link = WalkthroughLink.all[16]
    check_link("sound_walkthrough", "sound", "Sound")
  end
    
  it "should have a 'productions' link" do
    @link = WalkthroughLink.all[17]
    check_link("productions_walkthrough", "productions", "Productions")
  end

  it "should have a 'stages' link" do
    @link = WalkthroughLink.all[18]
    check_link("stages_walkthrough", "stages", "Stages")
  end
   
end