require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "walkthrough_link"

describe "Documentation" do
  before(:each) do
    link = WalkthroughLink.new(:id => "some id", :text => "some text", :slideshow => "some slideshow", :title => "Some Title")
    WalkthroughLink.stub!(:all).and_return([link])
  end
  
  uses_scene :documentation
  
  describe "toc_categories" do
    it "should have the walkthrough tutorial initially selected" do
      walkthrough = scene.find('Walkthrough')
      
      walkthrough.style.has_extension(scene.styles['selected_toc_heading']).should be_true
      walkthrough.style.has_extension(scene.styles['left_toc_heading']).should be_true
    end
    
    it "should have the rdoc section initially unselected " do
      rdoc = scene.find('RDoc')
      
      rdoc.style.has_extension(scene.styles['unselected_toc_heading']).should be_true
      rdoc.style.has_extension(scene.styles['right_toc_heading']).should be_true
    end
  end

  describe "table of contents links" do
    it "should have a 'getting started' link" do
      link = scene.find("some id")
      link.should_not be_nil
      
      link.slideshow.should == "some slideshow"
      link.text.should == "some text"
      link.title.should == "Some Title"
    end
  end
  
  describe "RDoc" do
    it "should display the props as table of contents when clicked" do
      pending
      production.rdoc = {"classname" => "Prop DSL"}
      rdoc = scene.find('RDoc')
      rdoc.mouse_clicked(nil)
      
      scene.find_by_name("class_link")[0].text.should == "classname"
    end
    
    it "should display all the keys, not just the first" do
      pending
      production.rdoc = {"animation" => "Prop DSL", "classname" => "Prop DSL"}
      rdoc = scene.find('RDoc')
      rdoc.mouse_clicked(nil)
      
      scene.find_by_name("class_link")[0].text.should == "animation"
      scene.find_by_name("class_link")[1].text.should == "classname"
    end
  end
end
