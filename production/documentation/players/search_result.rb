module SearchResult
  attr_accessor :class_name
  
  def mouse_clicked(event)
    scene.find("class_link_#{class_name}").mouse_clicked(nil)
    scene.remove(scene.find('search_results_screen'))
  end
  
  # def mouse_entered(e)
  #   puts "index: #{self.parent.children.rindex(self)}"
  # end
end