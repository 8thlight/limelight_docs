require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "Search Text" do
  uses_limelight :with_player => "search_text", :scene_path => "documentation"
  
  it "should build the search results screen when a key is pressed" do
    search_text.text = "blah"
    search_text.key_released(nil)
    
    screen = scene.find('search_results_screen')
    
    screen.name.should == 'search_results_screen'
  end
  
  it "should destroy the search_results_screen if the text is empty (the key press was a delete)" do
    search_text.text = ''
    search_text.key_released(nil)
    
    scene.find('search_results_screen').should be_nil
  end
  
  it "should only create the search_results_screen once" do
    search_text.text = 'ninja'
    search_text.key_released(nil)
    
    lambda{search_text.key_released(nil)}.should_not raise_error
  end
end