module SearchText    
  def key_released(e)
    if self.text.empty?
      clear_results_screen
    else
      build_search_results
    end
  end
    
  def build_search_results
    @match = production.rdoc.search(self.text)
    create_search_results_screen
    rebuild_results
  end
  
  def create_search_results_screen
    scene.build { search_results_screen :id => 'search_results_screen' } if scene.find('search_results_screen').nil?
  end
  
  def rebuild_results
    search_results_screen = scene.find('search_results_screen')
    search_results_screen.remove_all
    search_results_screen.build(:match => @match) do
      __install "documentation/common/class_search_results.rb", :classes => @match.classes
    end
  end
  
  def clear_results_screen
    scene.remove(scene.find('search_results_screen'))
  end
end