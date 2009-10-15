require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "Section" do
  uses_limelight :scene_path => "documentation" do
    section :id => "section" do
      section_header :id => "section_header"
      section_links :id => "section_links", :players => "shrinkable"
    end
  end
  
  def section
    scene.find('section')
  end
  
  def section_links
    scene.find('section_links')
  end
  
  def section_header
    scene.find('section_header')
  end
  
  it "should shrink the section_links" do
    section_links.grow
    
    section.close
    
    section_links.should be_shrunk
  end
  
  it "should grow the section_links" do
    section_links.shrink
    
    section.open
    
    section_links.should_not be_shrunk
  end
end