require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'documentation/players/section_header'

describe "Section Header" do
  uses_player :section_header
    
  it "should shrink the specified prop when clicked to 0 by 0" do
    player.prop_to_remove = "my_prop"
    cast_prop_with_id('my_prop')
    
    @prop.stub!(:shrunk?).and_return(false)
    @prop.should_receive(:shrink)
    
    player.mouse_clicked(nil)
  end
  
  it "should shrink other props" do
    player.prop_to_remove = "my_prop"
    cast_prop_with_id('not_my_prop')
    
    @prop.should_not_receive(:shrink)
    
    player.mouse_clicked(nil)
  end
  
  it "should resize prop back if the prop is shrunk" do
    player.prop_to_remove = "my_prop"
    cast_prop_with_id('my_prop')
    
    @prop.stub!(:shrunk?).and_return(true)
    @prop.should_receive(:grow)
    @prop.should_not_receive(:shrink)
    
    player.mouse_clicked(nil)
  end
    
  def cast_prop_with_id(id)
    @prop = Limelight::Prop.new(:id => id)
    player << @prop
  end
    
end