require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "DirectionsTutorialLink" do
  uses_limelight :scene_path => "documentation" do
    section_header :id => "section"
    directions_tutorial_link :id => 'directions_tutorial_link', :section_id => 'section', :toc_link_id => "link_to_select"
    link_to_select :id => 'link_to_select'
  end
  
  def directions_tutorial_link
    scene.find('directions_tutorial_link')
  end
  
  def toc_link
    scene.find('link_to_select')
  end
  
  def section
    scene.find('section')
  end
  
  it "should click the selected toc_link" do
    section.stub!(:open_section)
    
    toc_link.should_receive(:mouse_clicked)
    directions_tutorial_link.mouse_clicked(nil)
  end
  
  it "should open the section before it is in it" do
    section.should_receive(:open_section).ordered
    toc_link.should_receive(:mouse_clicked).ordered
    
    directions_tutorial_link.mouse_clicked(nil)
  end
end