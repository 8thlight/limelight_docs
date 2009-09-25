require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")


describe "RDoc Links Player" do
  uses_scene :documentation
  
  before(:each) do
    @rdoc_link = scene.find("RDoc")
  end
  
  it "should display the props as table of contents when casted" do
    production.rdoc = {"classname" => "Prop DSL"}
    
    @rdoc_link.mouse_clicked(nil)
    
    scene.find_by_name("class_link")[0].text.should == "classname"
  end

  it "should display all the keys, not just the first" do
    production.rdoc = {"animation" => "Prop DSL", "classname" => "Prop DSL"}
    
    @rdoc_link.mouse_clicked(nil)
    
    scene.find_by_name("class_link")[0].text.should == "animation"
    scene.find_by_name("class_link")[1].text.should == "classname"
  end
  
  it "should only do this once" do
    production.rdoc =  {"classname" => "Prop DSL"}
    
    @rdoc_link.mouse_clicked(nil)
    @rdoc_link.mouse_clicked(nil)
    
    scene.find_by_name("class_link").size.should == 1
  end
  
  it "should sort them alphabetically" do
    production.rdoc =  {"zeeeclassname" => "Prop DSL", "aaaaaclassname" => "Prop DSL"}

    @rdoc_link.mouse_clicked(nil)
    
    scene.find_by_name("class_link")[0].text.should == "aaaaaclassname"
    scene.find_by_name("class_link")[1].text.should == "zeeeclassname"
  end
end
