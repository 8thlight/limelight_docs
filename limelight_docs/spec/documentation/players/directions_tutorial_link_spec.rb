require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "DirectionsTutorialLink" do
  uses_limelight :scene_path => "documentation" do
    directions_tutorial_link :id => 'directions_tutorial_link'
    link_to_select :id => 'link_to_select'
  end
  
  def directions_tutorial_link
    scene.find('directions_tutorial_link')
  end
  
  def toc_link
    scene.find('link_to_select')
  end
  
  it "should click the selected toc_link" do
    directions_tutorial_link.toc_link_id = "link_to_select"

    toc_link.should_receive(:mouse_clicked)
    directions_tutorial_link.mouse_clicked(nil)
  end  
end