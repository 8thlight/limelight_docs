require 'spec_helper'
require "toc_section"

describe "Documentation" do
  uses_limelight :scene => "documentation"

  it "should show activity" do
    scene.show_activity("I'm being tested")
    scene.activity_text.text.should == "I'm being tested"
  end

  describe "toc_categories" do
    it "should have the walkthrough tutorial initially selected" do
      walkthrough = scene.find('Walkthrough')

      walkthrough.should have_style_extension("selected_toc_heading")
      walkthrough.should have_style_extension("left_panel_cap")
    end

    it "should have the rdoc section initially unselected " do
      production.rdoc = nil
      rdoc = scene.find('RDoc')

      rdoc.should have_style_extension("disabled_toc_heading")
      rdoc.should have_style_extension("right_panel_cap")
    end
  end

  describe "table of contents links" do
    it "should have a 'getting started' link" do
      link = scene.find("getting_started_walkthrough")
      link.should_not be_nil

      link.slideshow.should == "getting_started"
      link.text.should == "Getting Started"
      link.title.should == "Getting Started"
    end
  end

  describe "select_toc_prop" do
    it "should select the passed in toc prop" do
      link = scene.find("getting_started_walkthrough")
      scene.select_toc_prop(link)

      link.should have_style_extension("selected_toc_item")
    end

    it "should unselect the previous prop" do
      link = scene.find('getting_started_walkthrough')
      rdoc = scene.find('backgrounds_walkthrough')

      scene.select_toc_prop(link)
      scene.select_toc_prop(rdoc)

      link.should_not have_style_extension("selected_toc_item")
    end
  end
end

describe "Documentation scene with shrinkables" do
  uses_limelight :scene_path => "documentation", :scene_name => "documentation" do
    section_header :prop_to_remove => "shrinkable_one", :start_shrunk => false
    section_links :id => "shrinkable_one", :players => "shrinkable"

    section_header :prop_to_remove => "shrinkable_two", :start_shrunk => true
    section_links :id => "shrinkable_two", :players => "shrinkable"

    section_header :prop_to_remove => "shrinkable_three", :start_shrunk => false
    section_links :id => "shrinkable_three", :players => "shrinkable"
  end

  before(:each) do
    Java::limelight.ui.events.panel.SceneOpenedEvent.new.dispatch(scene.peer)
  end

  it "should not shrink the first shrinkable prop" do
    scene.find("shrinkable_one").should_not be_shrunk
  end

  it "should shrink the second shrinkable prop" do
    scene.find("shrinkable_two").should be_shrunk
  end
  
  it "should not shrink the third shrinkable prop" do
    scene.find("shrinkable_three").should_not be_shrunk
  end
end
