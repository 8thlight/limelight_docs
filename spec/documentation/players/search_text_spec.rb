require 'spec_helper'

SearchResults = Struct.new(:classes, :found_methods, :comments)
ClassResult = Struct.new(:full_name, :module?)
KEY = {:esc => 27, :a => 65, :left => 37, :up => 38, :right => 39, :down => 40, :enter => 10}


describe "Search Text" do
  uses_limelight :with_players => "search_text", :scene_path => "documentation"

  describe "Showing and Hiding" do
    before(:each) do
      production.rdoc = mock("RDoc").as_null_object
    end
    
    it "should build the search results screen when a key is pressed" do
      search_text.text = "blah"
      keyboard.release KEY[:a], search_text
      screen = scene.find('search_results_screen')

      screen.name.should == 'search_results_screen'
    end

    it "should destroy the search_results_screen if the text is empty (the key press was a delete)" do
      search_text.text = ''
      keyboard.release KEY[:a], search_text

      scene.find('search_results_screen').should be_nil
    end

    it "should only create the search_results_screen once" do
      search_text.text = 'ninja'
      keyboard.release KEY[:a], search_text

      lambda{keyboard.release(KEY[:a], search_text)}.should_not raise_error
    end
  end
  
  describe "Searching" do
    
    before(:each) do
      @rmock = mock("RDoc", :search => SearchResults.new([], [], []))
      production.rdoc = @rmock
      search_text.text = "ninja"
    end
    
    it "should search the RDoc with the key press" do
      @rmock.should_receive(:search).with("ninja")
      keyboard.release KEY[:a], search_text
    end
    
    it "should not search the rdoc if text is empty" do
      search_text.text = ""
      
      @rmock.should_not_receive(:search)
      keyboard.release KEY[:a], search_text
    end
    
    it "should install a class for each returned class" do
      @rmock.stub!(:search).and_return(SearchResults.new([ClassResult.new("classname_1"), ClassResult.new("class_name2")], [], []))
      
      keyboard.release KEY[:a], search_text
      
      scene.find_by_name("search_result").size.should == 2
    end
    
    it "should rebuild the class results when new keys are pressed" do
      first_result = SearchResults.new([ClassResult.new("classname_1"), ClassResult.new("class_name2")], [], [])
      second_result = SearchResults.new([ClassResult.new("classname_1"), ClassResult.new("class_name2"), ClassResult.new("class_name3")], [], [])
      @rmock.stub!(:search).and_return(first_result, second_result)
      
      keyboard.release KEY[:a], search_text
      search_text.text = "class_name"
      keyboard.release KEY[:a], search_text
      
      scene.find_by_name("search_result").size.should == 3
    end
    
    describe "Modifying Search Criteria" do
      it "should not rebuild the scene when the text does not change" do
        search_text.text = "Not Empty"
        keyboard.release KEY[:a], search_text

        @rmock.should_not_receive(:search)
        
        keyboard.release KEY[:a], search_text
      end
      
      describe "escape is pressed" do
        it "should not clear the text" do
          search_text.text = "Not empty"
          keyboard.press KEY[:esc], search_text
          keyboard.release KEY[:a], search_text
          
          search_text.text.should == "Not empty"
        end
      end
      
      describe "navigating with no criteria" do
        it "should not error on a down arrow press" do
          expect{keyboard.release(KEY[:down], search_text)}.to_not raise_error
          
        end

        it "should not error on a up arrow press" do
          expect{keyboard.press(KEY[:up], search_text)}.to_not raise_error
        end

        it "should not error on enter" do
          expect{keyboard.press(KEY[:enter], search_text)}.to_not raise_error
        end
      end
      
      describe "navigating non empty results" do
        before(:each) do
          search_text.text = "Not empty"
          keyboard.release KEY[:a], search_text
          search_result = SearchResults.new([ClassResult.new("classname_1"), ClassResult.new("class_name2"), ClassResult.new("class_name3")], [], [])
          @rmock.stub!(:search).and_return(search_result)
        end

        it "should go to the next search result" do
          result = scene.find('search_results_screen')
          result.should_receive(:next)
          keyboard.press KEY[:down], search_text
        end
        
        it "should go to the next search result" do
          result = scene.find('search_results_screen')
          result.should_receive(:previous)
          keyboard.press KEY[:up], search_text
        end
        
        it "should show the current search result" do
          result = scene.find('search_results_screen')
          result.should_receive(:show_current)
          keyboard.press KEY[:enter], search_text
        end
      end
      
      describe "navigating empty search results" do
        it "should search when down is pressed" do
          keyboard.press KEY[:down], search_text
          
          scene.find("search_results_screen").should_not be_nil
        end
      end
    end
  end
end
