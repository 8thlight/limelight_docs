require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'entrance'

describe "ClassLink" do
  uses_limelight :with_player => "class_link", :scene_path => "documentation", :scene_name => "documentation" 

  before(:each) do
    @parent = mock("prop", :grow => nil)
    class_link.stub!(:parent).and_return(@parent)
    stub_select_link
    stub_cueing_rdoc
  end
  
  it "should cue the props from the dsl in the rdoc hash" do
    production.rdoc = {"class_text" => "Prop DSL"}

    class_link.class_name = "class_text"

    Entrance.should_receive(:cue_rdoc).with(scene, "Prop DSL")

    class_link.mouse_clicked(nil)
  end

  it "should select this link" do
    scene.should_receive(:select_toc_prop).with(class_link)

    class_link.mouse_clicked(nil)
  end

  it "should grow the parent" do
    @parent.should_receive(:grow)

    class_link.mouse_clicked(nil)
  end
  
  def stub_cueing_rdoc
    production.rdoc = {}
    Entrance.stub!(:cue_rdoc)
  end

  def stub_select_link
    scene.stub!(:select_toc_prop)
  end
end