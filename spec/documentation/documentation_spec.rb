require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Documentation" do
  uses_scene :documentation

  describe "table of contents links" do
    
    def check_link(id, entrance, text)
      link = scene.find(id)
      
      link.should_not be_nil
      link.entrance.should == entrance
      link.text.should == text
    end

    it "should have a 'getting started' link" do
      check_link("getting_started_walkthrough", "getting_started", "Getting Started")
    end
    
    it "should have a 'creating props' link" do
      check_link("creating_props_walkthrough", "creating_props", "Creating Props")
    end
    
    it "should have an 'editing styles' link" do
      check_link("editing_styles_walkthrough", "editing_styles", "Editing Styles")
    end
    
    it "should have a 'productions' link" do
      check_link("productions_walkthrough", "productions", "Productions")
    end
    
    it "should have a 'stages' link" do
      check_link("stages_walkthrough", "stages", "Stages")
    end
    
    it "should have a 'prop layout' link" do
      check_link("prop_layout_walkthough", "prop_layout", "Prop Layout")
    end

    it "should have a 'colors' link" do
      check_link("colors_walkthrough", "colors", "Colors")
    end
    
    it "should have a 'prop sizing' link" do
      check_link("prop_sizing_walkthough", "prop_sizing", "Prop Sizing")
    end
    
    it "should have a 'players' link " do
      check_link("players_walkthrough", "players", "Players")
    end
    
    it "should have an 'animations' link" do
      check_link("animations_walkthrough", "animations", "Animations")
    end
    
    it "should have a 'gradients' link" do
      check_link("gradients_walkthrough", "gradients", "Gradients")
    end
    
  end
end
