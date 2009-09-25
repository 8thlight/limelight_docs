require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'documentation/players/class_link'
require 'entrance'

class TestClassLink
  include ClassLink
  attr_accessor :text
  
  def scene
    "scene"
  end
end

describe "ClassLink" do
  uses_scene :fake
  
  it "should cue the props from the dsl in the rdoc hash" do
    production.rdoc = {"class_text" => "Prop DSL"}
    player = TestClassLink.new
    player.text = "nil"
    
    Entrance.should_receive(:cue_rdoc).with(player.scene, "Prop DSL")
    
    player.mouse_clicked(nil)
  end
end
