require File.dirname(__FILE__) + '/../../spec_helper'
require "documentation/players/search_result"

describe SearchResult do
  uses_limelight :scene_path => "documentation" do
    prop :id => "search_results_screen"
    search_result :id => "search_result"
  end
  
  def search_result
    scene.find("search_result")
  end
  
  it "should remove the search_results_screen" do
    search_result.mouse_clicked(nil)
    
    scene.find("search_results_screen").should be_nil
  end
end