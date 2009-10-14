require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "RDoc Links Player" do
  
  uses_limelight :scene_path => "documentation", :scene_name => 'documentation', :with_player => 'rdoc_links'  
  
  before(:each) do
    production.rdoc = nil
    scene # this will cast the player without rdoc so that we can cast it later with the desired rdoc
  end
    
  it "should display the props as table of contents when casted" do
    production.rdoc = {"classname" => "Prop DSL"}
    
    rdoc_links.casted
    
    scene.find_by_name("class_link").should_not be_empty
  end

  it "should display all the keys, not just the first" do
    production.rdoc = {"animation" => "Prop DSL", "classname" => "Prop DSL"}
    
    rdoc_links.casted
    
    scene.find_by_name("class_link")[0].text.should == "animation"
    scene.find_by_name("class_link")[1].text.should == "classname"
  end
    
  it "should sort them alphabetically" do
    production.rdoc =  {"zeeeclassname" => "Prop DSL", "aaaaaclassname" => "Prop DSL"}
  
    rdoc_links.casted
    
    scene.find_by_name("class_link")[0].text.should == "aaaaaclassname"
    scene.find_by_name("class_link")[1].text.should == "zeeeclassname"
  end
  
  it "should sort all the unnamespaced names after the props with namespaces" do
    production.rdoc =  {"aaaclassname" => "Prop DSL", "Limelight::Prop" => "Prop DSL"}
    
    rdoc_links.casted
    
    scene.find_by_name('class_link')[0].text.should == "Prop"
    scene.find_by_name('class_link')[1].text.should == "aaaclassname"
  end
  
  it "should not throw an exception if production.props is nil" do
    production.rdoc = nil
    
    lambda{ rdoc_links.casted }.should_not raise_error
  end
  
  it "should write class section headers when classes are namespaced" do
    production.rdoc = {"Class" => "DSL", "Limelight::Builtin" => "Monkey"}
    
    rdoc_links.casted
    
    scene.find_by_name('class_header')[0].text.should == "Limelight"
  end
  
  it "should not write class section headers for the last entry in a name" do
    production.rdoc = {"Limelight::Builtin" => "Monkey"}
    
    rdoc_links.casted
    
    scene.find_by_name('class_header').size.should == 1
  end
  
  it "should not write class sections more than once" do
    production.rdoc = {"Limelight::Builtin" => "Monkey", "Limelight::Player" => "Man"}
    
    rdoc_links.casted
    
    scene.find_by_name('class_header').size.should == 1
  end
  
  it "should have a header prop with the right prop to remove" do
    production.rdoc = {"Limelight::Builtin" => "Monkey"}
    
    rdoc_links.casted
    
    header_prop = scene.find_by_name('class_header')[0]
    header_prop.prop_to_remove.should == 'limelight_links'
  end
  
  it "should write a shrinkable section for the built in - already shrunk" do
    production.rdoc = {"Limelight::Builtin" => "Monkey"}
    
    rdoc_links.casted

    shrinkable_section = rdoc_links.children[1]
    shrinkable_section.shrunk?.should be_true
  end
  
  it "should add the classname to that shrinkable prop" do
    production.rdoc = {"Limelight::Builtin" => "Monkey"}
    
    rdoc_links.casted
    
    shrinkable_section = rdoc_links.children[1]
    shrinkable_section.children[0].name.should == "class_link"
    shrinkable_section.children[0].text.should == "Builtin"
  end
  
  it "should append the id to the shrinkable prop" do
    production.rdoc = {"Limelight::Builtin" => "Monkey"}
    
    rdoc_links.casted
    
    shrinkable_section = rdoc_links.children[1]
    shrinkable_section.id.should == "limelight_links"
  end
  
  it "should continue nesting deeper into the namespace" do
    production.rdoc = {"Limelight::Builtin::Players" => "Prop DSL"}
    
    rdoc_links.casted
    
    builtin_section = rdoc_links.children[1]
    builtin_section.children[0].name.should == "class_header"
    builtin_section.children[0].text.should == "Builtin"
    builtin_section.children[1].should be_shrunk
  end
  
  it "should put the class link in the final shrunken prop" do
    production.rdoc = {"Limelight::Builtin::Players" => "Prop DSL"}
    
    rdoc_links.casted
    
    rdoc_links.children[1].children[1].children[0].text.should == "Players"
  end
    
  it "should have links for more than one class all in one prop" do
    production.rdoc = {"Limelight::Builtin" => "Prop DSL", "Limelight::Monkey" => "Prop DSL"}
    
    rdoc_links.casted
    
    class_section = scene.find_by_name('class_section')[0]
    class_section.children[0].text.should == 'Builtin'
    class_section.children[1].text.should == 'Monkey'
  end
  
  it "should handle backup up in the namespaces" do
    production.rdoc = {"Limelight::Player" => "", "Limelight::Player::Builtin" => "", "Limelight::Quiz" => ""}
    
    rdoc_links.casted
    
    scene.find_by_name('class_header').size.should == 2
    quiz_section = scene.find_by_name('class_link')[2]
    quiz_section.text.should == "Quiz"
  end
  
  it "should make sure the class_section id is unique by using full name with underscores" do
    production.rdoc = {"Limelight::Builtin::Test" => "Prop DSL"}
    
    rdoc_links.casted
    
    class_section = scene.find_by_name('class_section')[1]
    class_section.id.should == "limelight_builtin_links"
  end
  
  it "should link the header with the right name" do
    production.rdoc = {"Limelight::Builtin::Test" => "Prop DSL"}
    
    rdoc_links.casted
    
    class_section = scene.find_by_name('class_header')[1]
    class_section.prop_to_remove.should == "limelight_builtin_links"
  end
  
  it "should put the full class name on the class link" do
    production.rdoc = {"Limelight::Builtin::Test" => "Prop Blah"}
    
    rdoc_links.casted
    
    class_section = scene.find_by_name('class_link')[0]
    class_section.class_name.should == "Limelight::Builtin::Test"
  end
end
