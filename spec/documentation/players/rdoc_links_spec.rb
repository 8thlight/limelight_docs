require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'documentation/players/rdoc_links'

describe "RDoc Links Player" do
  uses_player :rdoc_links
  
  it "should display the props as table of contents when casted" do
    scene.rdoc = {"classname" => "Prop DSL"}
    
    player.casted
    
    scene.find_by_name("class_link").should_not be_empty
  end

  it "should display all the keys, not just the first" do
    scene.rdoc = {"animation" => "Prop DSL", "classname" => "Prop DSL"}
    
    player.casted
    
    scene.find_by_name("class_link")[0].text.should == "animation"
    scene.find_by_name("class_link")[1].text.should == "classname"
  end
    
  it "should sort them alphabetically" do
    scene.rdoc =  {"zeeeclassname" => "Prop DSL", "aaaaaclassname" => "Prop DSL"}
  
    player.casted
    
    scene.find_by_name("class_link")[0].text.should == "aaaaaclassname"
    scene.find_by_name("class_link")[1].text.should == "zeeeclassname"
  end
  
  it "should not throw an exception if production.props is nil" do
    scene.rdoc = nil
    
    lambda{ player.casted }.should_not raise_error
  end
  
  it "should write class section headers when classes are namespaced" do
    scene.rdoc = {"Class" => "DSL", "Limelight::Builtin" => "Monkey"}
    
    player.casted
    
    scene.find_by_name('class_header')[0].text.should == "Limelight"
  end
  
  it "should not write class section headers for the last entry in a name" do
    scene.rdoc = {"Limelight::Builtin" => "Monkey"}
    
    player.casted
    
    scene.find_by_name('class_header').size.should == 1
  end
  
  it "should not write class sections more than once" do
    scene.rdoc = {"Limelight::Builtin" => "Monkey", "Limelight::Player" => "Man"}
    
    player.casted
    
    scene.find_by_name('class_header').size.should == 1
  end
  
  it "should have a header prop with the right prop to remove" do
    scene.rdoc = {"Limelight::Builtin" => "Monkey"}
    
    player.casted
    
    header_prop = scene.find_by_name('class_header')[0]
    header_prop.prop_to_remove.should == 'limelight_links'
  end
  
  it "should underscore the full name for the id"
  
  it "should have links for more than one class all in one prop"
  
  # limelight_class_header = scene.find_by_name('class_header')[0]
  # limelight_class_header.children[0].text.should == "Monkey"
  # limelight_class_header.children[0].name.should == "Builtin"
  
  
  it "should handle backup up in the namespaces"
  
  it "should write them with player section_header"
  
  # it "should write the classes as children of their class header" do
  #   scene.rdoc = {"Limelight::Builtin" => "Monkey", "Limelight::Player" => "Man"}
  #   
  #   player.casted
  #   
  #   header = scene.find_by_name('class_header')
  # end
end
