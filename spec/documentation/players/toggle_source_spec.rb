require 'spec_helper'
require "documentation/players/toggle_source"

describe "ToggleSource" do
  uses_limelight :scene_path => "documentation" do
    toggle_source :text => "Show Source", :id => "toggle_source"
    method_source_codeblock :id => "method_source_codeblock"
  end

  def toggle_source_prop
    return scene.find("toggle_source")
  end

  def click_toggle_source
    toggle_source_prop.mouse_clicked(nil)
  end

  before(:each) do
    scene.find("content_pane").stub!(:update_now)
  end

  it "should show the Source" do
    click_toggle_source

    codeblock = scene.find("method_source_codeblock")
    codeblock.style.height.should == "auto"
  end

  it "should hide the Source after showing it" do
    click_toggle_source
    click_toggle_source

    codeblock = scene.find("method_source_codeblock")
    codeblock.style.height.should == "0"
  end

  it "should set the text to Hide Source after showing it" do
    click_toggle_source

    toggle_source_prop.text.should == "Hide Source"
  end

  it "should set the text back to Show Source after showing it" do
    click_toggle_source
    click_toggle_source

    toggle_source_prop.text.should == "Show Source"
  end
end
