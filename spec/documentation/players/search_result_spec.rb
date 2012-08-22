require 'spec_helper'

describe "SearchResult" do
  uses_limelight :scene_path => "documentation", :scene_name => "documentation" do
    prop :id => "search_results_screen"
    search_result :id => "search_result", :class_name => "Some::Class"
    class_link :id => "class_link_Some::Class"
  end

  before do
    @search_result = scene.find("search_result")
    @class_link = scene.find("class_link_Some::Class")
  end
  
  it "should remove the search_results_screen" do
    @search_result.stub!(:_click_class_link)
    mouse.click @search_result
    
    scene.find("search_results_screen").should be_nil
  end
  
  it "should click the appropriate class link" do
    @search_result.should_receive(:_click_class_link).with(@class_link)
    
    mouse.click @search_result
  end
  
  describe "selected?" do
    it "should not be selected" do
      @search_result.should_not be_selected
    end
    
    it "should be selected if it has the appropriate style" do
      @search_result.style.add_extension(scene.styles['selected_result'])
      @search_result.selected?.should be_true
    end
  end
end
