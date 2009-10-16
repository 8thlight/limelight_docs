require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "Search Text" do
  uses_limelight :with_player => "search_text", :scene_path => "documentation"
    
  describe "Showing and Hiding" do
    before(:each) do
      production.rdoc = mock("RDoc", :null_object => true)
    end
    
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
  
  describe "Searching" do
    before(:all) do
      SearchResults = Struct.new(:classes)
      ClassResult = Struct.new(:full_name)
    end
    
    before(:each) do
      @rmock = mock("RDoc", :search => SearchResults.new([]))
      production.rdoc = @rmock
      search_text.text = "ninja"
    end
    
    it "should search the RDoc with the key press" do
      @rmock.should_receive(:search).with("ninja")
      search_text.key_released(nil)
    end
    
    it "should not search the rdoc if text is empty" do
      search_text.text = ""
      
      @rmock.should_not_receive(:search)
      search_text.key_released(nil)
    end
    
    it "should install a class for each returned class" do
      @rmock.stub!(:search).and_return(SearchResults.new([ClassResult.new("classname_1"), ClassResult.new("class_name2")]))
      
      search_text.key_released(nil)
      
      scene.find_by_name("found_class").size.should == 2
    end
    
    it "should rebuild the class results when new keys are pressed" do
      first_result = SearchResults.new([ClassResult.new("classname_1"), ClassResult.new("class_name2")])
      second_result = SearchResults.new([ClassResult.new("classname_1"), ClassResult.new("class_name2"), ClassResult.new("class_name3")])
      @rmock.stub!(:search).and_return(first_result, second_result)
      
      search_text.key_released(nil)
      search_text.key_released(nil)
      
      scene.find_by_name("found_class").size.should == 3
    end
  end
  
end