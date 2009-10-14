require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'entrance'

describe "RunPlayersButton" do
  with_stubbed_doc_loader do
    uses_scene :documentation
  
    before(:each) do
      Entrance.cue_common scene, :players_sandbox
      @players_button = scene.find("sandbox_button")
      @code = scene.find("code")
      @canvas = scene.find("canvas")
      @prop_to_extend = Limelight::Prop.new(:name => "prop_to_extend", :id => "mi madre")
    
      @canvas << @prop_to_extend
    end
  
    it "should append behavior on click to prop" do
      @code.text = "def mouse_clicked(e); scene.find('code').text = 'changed';end"
    
      @players_button.mouse_clicked(nil)
      @prop_to_extend = @canvas.find_by_name("prop_to_extend")[0]
      @prop_to_extend.mouse_clicked(nil)
    
      @code.text.should == "changed"
    end
  
    it "should append behavior to a second prop" do
      @prop_to_extend = Limelight::Prop.new(:name => "prop_to_extend", :id => "prop two")
      @canvas << @prop_to_extend
    
      @code.text = "def mouse_clicked(e); scene.find('code').text = 'changed';end"
    
      @players_button.mouse_clicked(nil)
      @prop_to_extend.mouse_clicked(nil)
    
      @code.text.should == "changed"
    end
  
    it "should nicely handle errors" do
      @code.text = "I am not ruby code"
  
      @players_button.mouse_clicked(nil)
      prop = @canvas.children[1]
      prop.name.should == "error_message"
      prop.text.should == "(eval):1: , unexpected kNOT\n"
    end
  
    it "should clear the errors on repeated clicks" do
      @code.text = "I am not ruby code"
      @players_button.mouse_clicked(nil)
    
      @code.text = "def mouse_clicked(e); scene.find('code').text = 'changed';end"    
      @players_button.mouse_clicked(nil)
    
      @canvas.children.size.should == 1
    end
  end
end
