require 'spec_helper'
require 'entrance'

describe "RunPlayersButton" do
  uses_limelight :scene => "documentation"

  before(:each) do
    Entrance.cue_common scene, :players_sandbox
    @players_button = scene.find("sandbox_button")
    @code = scene.find("code")
    @canvas = scene.find("canvas")
    @prop_to_extend = Limelight::Prop.new(:name => "prop_to_extend", :id => "mi madre")

    @canvas << @prop_to_extend
  end

  it "should append behavior on click to prop" do
    @code.text = "on_mouse_clicked do; scene.find('code').text = 'changed';end"

    mouse.click @players_button
    @prop_to_extend = @canvas.find_by_name("prop_to_extend")[0]
    mouse.click @prop_to_extend

    @code.text.should == "changed"
  end

  it "should append behavior to a second prop" do
    @prop_to_extend = Limelight::Prop.new(:name => "prop_to_extend", :id => "prop two")
    @canvas << @prop_to_extend

    @code.text = "on_mouse_clicked do; scene.find('code').text = 'changed';end"

    mouse.click @players_button
    mouse.click @prop_to_extend

    @code.text.should == "changed"
  end

  it "should nicely handle errors" do
    @code.text = "I am not ruby code"

    mouse.click @players_button
    prop = @canvas.children[1]
    prop.name.should == "error_message"
    prop.text.should =~ /unexpected kNOT/
  end

  it "should clear the errors on repeated clicks" do
    @code.text = "I am not ruby code"
    mouse.click @players_button

    @code.text = "def mouse_clicked(e); scene.find('code').text = 'changed';end"
    mouse.click @players_button

    @canvas.children.size.should == 1
  end
end
