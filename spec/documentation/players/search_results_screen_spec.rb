require 'spec_helper'

describe "SearchResultsScreen" do
  uses_limelight :scene_path => "documentation" do
    search_results_screen :id => "search_results_screen" do
      search_result :id => "found_class_1" do
        icon :text => "Some Image"
        class_link :id => "search_result_1"
      end
      search_result :id => "found_class_2"
      search_result :id => "found_class_3"
    end
  end
  
  let(:search_results_screen) {scene.find("search_results_screen")}
  let(:results) {search_results_screen.children}
  let(:vertical_scrollbar) {mock("vertical_scroll_bar", :value= => nil, :value => 0)}
  
  before(:each) do
    search_results_screen.peer.stub!(:vertical_scrollbar).and_return(vertical_scrollbar)
  end
  
  it "should have nothing selected by default" do
    search_results_screen.children.each do |child|
      child.should_not be_selected
    end
  end

  context "with nothing selected" do
    it "should select the first element on next()" do
      search_results_screen.next
      results[0].should be_selected
      results[1].should_not be_selected
      results[2].should_not be_selected
    end
    
    it "should select the last element on previous()" do
      search_results_screen.previous
      results[0].should_not be_selected
      results[1].should_not be_selected
      results[2].should be_selected
    end
    
    it "should not show anything" do
      expect{search_results_screen.show_current}.to_not raise_error
    end
    
    it "should not remove the style from a child that doesn't have it" do
      scene.find("found_class_2").style.should_not_receive(:remove_extension)
      
      search_results_screen.next
    end
  end
  
  context "with the first element selected" do
    before(:each) do
      search_results_screen.next
    end
    
    it "should select the second element on next()" do
      search_results_screen.next
      results[0].should_not be_selected
      results[1].should be_selected
      results[2].should_not be_selected
    end
    
    it "should select the last element on previous()" do
      search_results_screen.previous
      results[0].should_not be_selected
      results[1].should_not be_selected
      results[2].should be_selected
    end
    
    it "should show the selected child" do
      scene.find("found_class_1").should_receive(:mouse_clicked).with(nil)
      search_results_screen.show_current
    end
  end
  
  context "with the last element selected" do
    before(:each) do
      3.times {search_results_screen.next}
    end
    
    it "should select the first element on next()" do
      search_results_screen.next
      results[0].should be_selected
      results[1].should_not be_selected
      results[2].should_not be_selected
    end
    
    it "should select the second element on previous()" do
      search_results_screen.previous
      results[0].should_not be_selected
      results[1].should be_selected
      results[2].should_not be_selected
    end
  end
  
  context "selecting a specific child" do
    it "should set the selected attribute" do
      search_results_screen.select_child(1)
      results[0].should_not be_selected
      results[1].should be_selected
      results[2].should_not be_selected
      search_results_screen.selected.should == 1
    end
  end
end

describe "SearchResultsScreen with no children" do
  uses_limelight :scene_path => "documentation" do
    search_results_screen :id => "search_results_screen"
  end
  
  let(:search_results_screen) {scene.find("search_results_screen")}
  
  it "should not error on next" do
    expect{search_results_screen.next}.to_not raise_error
  end
  
  it "should not error on previous" do
    expect{search_results_screen.previous}.to_not raise_error
  end
end
