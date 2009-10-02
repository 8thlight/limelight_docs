require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'documentation/players/class_link'
require 'entrance'

describe "ClassLink" do
  uses_player :class_link
  
  it "should cue the props from the dsl in the rdoc hash" do
    stub_select_link
    scene.rdoc = {"class_text" => "Prop DSL"}
    player.text = "class_text"
    
    Entrance.should_receive(:cue_rdoc).with(player.scene, "Prop DSL")
    
    player.mouse_clicked(nil)
  end
  
  it "should select this link" do
    stub_cueing_rdoc
    scene.should_receive(:select_toc_prop).with(player)
    
    player.mouse_clicked(nil)
  end
  
  def stub_cueing_rdoc
    scene.rdoc = {}
    Entrance.stub!(:cue_rdoc)
  end
  
  def stub_select_link
    scene.stub!(:select_toc_prop)
  end
end