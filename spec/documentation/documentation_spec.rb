require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "toc_section"
require 'documentation/players/documentation'

describe "Documentation" do  
  uses_scene :documentation
  
  describe "toc_categories" do
    it "should have the walkthrough tutorial initially selected" do
      walkthrough = scene.find('Walkthrough')
      
      walkthrough.should have_style_extension("selected_toc_heading")
      walkthrough.should have_style_extension("left_toc_heading")
    end
    
    it "should have the rdoc section initially unselected " do
      production.rdoc = nil
      rdoc = scene.find('RDoc')
      
      rdoc.should have_style_extension("disabled_toc_heading")
      rdoc.should have_style_extension("right_toc_heading")
    end
  end
  
  describe "table of contents links" do
    it "should have a 'getting started' link" do
      link = scene.find("getting_started_walkthrough")
      link.should_not be_nil
      
      link.slideshow.should == "getting_started"
      link.text.should == "Getting Started"
      link.title.should == "Getting Started"
      link.toc_link_id.should == "getting_started_walkthrough"
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
    
    # it "should make sure that the selected toc prop is in an open section" do
    #   link = scene.find('getting_started_walkthrough')
    #   
    #   scene.selected_toc_item(link)
    # end
  end
end
