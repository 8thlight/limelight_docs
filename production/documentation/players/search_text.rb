module SearchText
  KEY = {:esc => 27, :a => 65, :left => 37, :up => 38, :right => 39, :down => 40, :enter => 10}
  
  def key_released(event)
    if search_criteria.empty?
      clear_results_screen
    elsif search_criteria_changed?
      build_search_results
    end
  end
  
  def key_pressed(event)
    case event.get_key_code
    when KEY[:esc]
      self.text = ""
    when KEY[:down]
      search_results_screen.next if search_results_screen
    when KEY[:up]
      search_results_screen.previous if search_results_screen
    when KEY[:enter]
      search_results_screen.show_current if search_results_screen
    end
  end
  
  def build_search_results
    results = perform_search
    create_search_results_screen
    rebuild_results(results)
  end
  
  def create_search_results_screen
    scene.build { search_results_screen :id => 'search_results_screen' } if search_results_screen.nil?
  end
  
  def rebuild_results(results)
    search_results_screen.remove_all
    search_results_screen.build(:match => results) do
      __install "documentation/common/class_search_results.rb", :classes => @match.classes
    end
  end
  
  def clear_results_screen
    scene.remove(scene.find('search_results_screen'))
  end
  
  def perform_search
    record_search_criteria
    production.rdoc.search(search_criteria)
  end
  
  def record_search_criteria
    @last_search_criteria = search_criteria
  end
  
  def search_criteria_changed?
    search_criteria != @last_search_criteria
  end
  
  def search_criteria
    self.text
  end
  
  def search_results_screen
    scene.find("search_results_screen")
  end
end