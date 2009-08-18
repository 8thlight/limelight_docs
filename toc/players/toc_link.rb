module TocLink
  attr_accessor :scene_file
  
  def mouse_clicked(e)
    pane = scene.find("content_pane")    
    pane.remove_all
    
    the_entrance = self.scene_file
    pane.build do
      __install the_entrance
    end
    
    scene.the_context = scene.find("walkthrough")
  end
  
end