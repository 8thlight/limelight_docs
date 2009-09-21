require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'documentation/players/rdoc_link'

class TestRDocLink
  include RDocLink
  
  def scene
    "scene"
  end
end

describe "RdocLink" do
  uses_scene :documentation
  
  before(:each) do
    @link = scene.find_by_name("rdoc_link")[0]
  end
  
  it "should cue the rdoc" do
    player = TestRDocLink.new
    player.klass_name = "klass_name"
    
    Entrance.should_receive(:cue_rdoc).with(player.scene, "klass_name")
    
    player.mouse_clicked(nil)
  end
  
    
end
