module SearchText    
  def key_released(e)
    if self.text.empty?
      clear_results_screen
    else
      build_search_results
    end
  end
    
  def build_search_results
    scene.build { search_results_screen :id => 'search_results_screen' do temp_prop :text => "Class Match" end} unless scene.find('search_results_screen')
  end
  
  def clear_results_screen
    scene.remove(scene.find('search_results_screen'))
  end
end