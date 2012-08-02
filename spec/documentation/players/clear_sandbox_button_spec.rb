require 'spec_helper'
require 'entrance'

describe "ClearSandboxButton" do
  uses_scene :documentation

  describe "Prop Sandbox" do

    before(:each) do
      Entrance.cue_common scene, :prop_sandbox
      @clear_button = scene.find('clear_sandbox_button')
    end

    it "should have a clear button" do
      @clear_button.should_not be_nil
    end

    it "should clear the canvas" do
      @canvas = scene.find('canvas')
      prop = Limelight::Prop.new
      @canvas << prop

      @clear_button.button_pressed(nil)

      @canvas.children.include?(prop).should_not be_true
    end
  end

  describe "Styles Sandbox" do

    it "should not have a clear button" do
      Entrance.cue_common scene, :styles_sandbox

      scene.find('clear_sandbox_button').should be_nil
    end
  end

  describe "Players Sandbox" do

    it "should not have a clear button" do
      Entrance.cue_common scene, :players_sandbox

      scene.find('clear_sandbox_button').should be_nil
    end
  end
end
