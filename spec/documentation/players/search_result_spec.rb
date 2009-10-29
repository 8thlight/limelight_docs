require File.dirname(__FILE__) + '/../../spec_helper'
require "documentation/players/search_result"

describe SearchResult do
  uses_limelight :scene_path => "documentation" do
    prop :id => "search_results_screen"
    search_result :id => "search_result", :class_name => "Some::Class"
    class_link :id => "class_link_Some::Class"
  end
  
  def search_result
    scene.find("search_result")
  end
  
  def class_link
    scene.find("class_link_Some::Class")
  end
  
  it "should remove the search_results_screen" do
    class_link.stub!(:mouse_clicked)
    search_result.mouse_clicked(nil)
    
    scene.find("search_results_screen").should be_nil
  end
  
  it "should click the appropriate class link" do
    class_link.should_receive(:mouse_clicked).with(nil)
    
    search_result.mouse_clicked(nil)
  end
  
  describe "selected?" do
    it "should not be selected" do
      search_result.should_not be_selected
    end
    
    it "should be selected if it has the appropriate style" do
      search_result.style.add_extension(scene.styles['selected_result'])
      search_result.should be_selected
    end
  end
end