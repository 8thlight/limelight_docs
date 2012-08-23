require 'spec_helper'

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
    mouse # Get a mouse object instantiated
    section.stub!(:open_section)
    mouse_mock = mock("mouse")
    Limelight::Mouse.stub!(:new).and_return(mouse_mock)
    mouse_mock.should_receive(:click).with(toc_link)
    
    mouse.click directions_tutorial_link
  end
  
  it "should open the section before it is in it" do
    mouse # Get a mouse object instantiated
    mouse_mock = mock("mouse")
    Limelight::Mouse.stub!(:new).and_return(mouse_mock)

    section.should_receive(:open_section).ordered
    mouse_mock.should_receive(:click).with(toc_link).ordered
    
    mouse.click directions_tutorial_link
  end
end
