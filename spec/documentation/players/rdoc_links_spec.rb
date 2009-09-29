require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'documentation/players/rdoc_links'

describe "RDoc Links Player" do  
  before(:all) do
    stub_doc_loader
  end
  
  uses_scene :documentation
  
  before(:each) do
    @rdoc_link = scene.find("RDoc")
    @rdoc_link.enable
  end
  
  it "should display the props as table of contents when casted" do
    scene.rdoc = {"classname" => "Prop DSL"}
    
    @rdoc_link.mouse_clicked(nil)
    
    scene.find_by_name("class_link").should_not be_empty
  end

  it "should display all the keys, not just the first" do
    scene.rdoc = {"animation" => "Prop DSL", "classname" => "Prop DSL"}
    
    @rdoc_link.mouse_clicked(nil)
    
    scene.find_by_name("class_link")[0].text.should == "animation"
    scene.find_by_name("class_link")[1].text.should == "classname"
  end
  
  it "should only do this once" do
    scene.rdoc =  {"classname" => "Prop DSL"}
    
    @rdoc_link.mouse_clicked(nil)
    @rdoc_link.mouse_clicked(nil)
    
    scene.find_by_name("class_link").size.should == 1
  end
  
  it "should sort them alphabetically" do
    scene.rdoc =  {"zeeeclassname" => "Prop DSL", "aaaaaclassname" => "Prop DSL"}
  
    @rdoc_link.mouse_clicked(nil)
    
    scene.find_by_name("class_link")[0].text.should == "aaaaaclassname"
    scene.find_by_name("class_link")[1].text.should == "zeeeclassname"
  end
  
  it "should not throw an exception if production.props is nil" do
    scene.rdoc = nil
    
    lambda{ @rdoc_link.mouse_clicked(nil) }.should_not raise_error
  end
  
  it "should use the selected link object to select links" do
    
    
  end
  
end
