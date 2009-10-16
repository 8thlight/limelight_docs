module SearchResult
  include ClassLink
  
  alias_method :old_mouse_clicked, :mouse_clicked
  
  def mouse_clicked(event)
    old_mouse_clicked(event)
    scene.remove(scene.find('search_results_screen'))
  end
end