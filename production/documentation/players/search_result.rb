module SearchResult
  attr_accessor :class_name
  
  def mouse_clicked(event)
    scene.find("class_link_#{class_name}").mouse_clicked(nil)
    scene.remove(scene.find('search_results_screen'))
  end
  
  def mouse_entered(e)
    #test me
    index = self.parent.children.rindex(self)
    self.parent.select_child(index)
  end
  
  def selected?
    self.style.has_extension(scene.styles['selected_result'])
  end
end