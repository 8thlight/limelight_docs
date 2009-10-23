require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require "documentation/players/search_text"

SearchResults = Struct.new(:classes, :found_methods)
ClassResult = Struct.new(:full_name)

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
  
  def event(opts={})
    defaults = {:get_key_code => SearchText::KEY[:a]}
    @event ||= mock("Event", defaults.merge(opts))
  end
  
  describe "Searching" do
    
    before(:each) do
      @rmock = mock("RDoc", :search => SearchResults.new([], []))
      production.rdoc = @rmock
      search_text.text = "ninja"
    end
    
    it "should search the RDoc with the key press" do
      @rmock.should_receive(:search).with("ninja")
      search_text.key_released(event)
    end
    
    it "should not search the rdoc if text is empty" do
      search_text.text = ""
      
      @rmock.should_not_receive(:search)
      search_text.key_released(event)
    end
    
    it "should install a class for each returned class" do
      @rmock.stub!(:search).and_return(SearchResults.new([ClassResult.new("classname_1"), ClassResult.new("class_name2")], []))
      
      search_text.key_released(event)
      
      scene.find_by_name("class_result").size.should == 2
    end
    
    it "should rebuild the class results when new keys are pressed" do
      first_result = SearchResults.new([ClassResult.new("classname_1"), ClassResult.new("class_name2")], [])
      second_result = SearchResults.new([ClassResult.new("classname_1"), ClassResult.new("class_name2"), ClassResult.new("class_name3")], [])
      @rmock.stub!(:search).and_return(first_result, second_result)
      
      search_text.key_released(event)
      search_text.text = "class_name"
      search_text.key_released(event)
      
      scene.find_by_name("class_result").size.should == 3
    end
    
    describe "Modifying Search Criteria" do
      it "should not rebuild the scene when the text does not change" do
        search_text.text = "Not Empty"
        search_text.key_released(event)

        @rmock.should_not_receive(:search)
        
        search_text.key_released(event)
      end
      
      describe "escape is pressed" do
        it "should clear the text" do
          search_text.text = "Not empty"
          event.should_receive(:get_key_code).and_return(SearchText::KEY[:esc])
          search_text.key_pressed(event)
          
          search_text.text.should == ""
        end
      end
      
      describe "navigating with no criteria" do
        it "should not error on a down arrow press" do
          expect{search_text.key_pressed(event(:get_key_code => SearchText::KEY[:down]))}.to_not raise_error
        end

        it "should not error on a up arrow press" do
          expect{search_text.key_pressed(event(:get_key_code => SearchText::KEY[:up]))}.to_not raise_error
        end

        it "should not error on enter" do
          expect{search_text.key_pressed(event(:get_key_code => SearchText::KEY[:enter]))}.to_not raise_error
        end
      end
      
      describe "navigating non empty results" do
        before(:each) do
          search_text.text = "Not empty"
          search_text.key_released(nil)
          search_result = SearchResults.new([ClassResult.new("classname_1"), ClassResult.new("class_name2"), ClassResult.new("class_name3")], [])
          @rmock.stub!(:search).and_return(search_result)
        end

        it "should go to the next search result" do
          result = scene.find('search_results_screen')
          result.should_receive(:next)
          search_text.key_pressed(event(:get_key_code => SearchText::KEY[:down]))
        end
        
        it "should go to the next search result" do
          result = scene.find('search_results_screen')
          result.should_receive(:previous)
          search_text.key_pressed(event(:get_key_code => SearchText::KEY[:up]))
        end
        
        it "should show the current search result" do
          result = scene.find('search_results_screen')
          result.should_receive(:show_current)
          search_text.key_pressed(event(:get_key_code => SearchText::KEY[:enter]))
        end
      end
    end
  end
end