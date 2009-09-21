require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'documentation/players/class_link'

class TestClassLink
  include ClassLink
  
  def scene
    "scene"
  end
end

describe "ClassLink" do
  uses_scene :documentation
  
  before(:each) do
    @link = scene.find_by_name("class_link")[0]
  end
  
  it "should cue the rdoc" do
    player = TestClassLink.new
    player.class_prop_file = "klass_name"
    
    Entrance.should_receive(:cue_rdoc).with(player.scene, "klass_name")
    
    player.mouse_clicked(nil)
  end
end
