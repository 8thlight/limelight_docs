module TocLink
  attr_accessor :scene_file
  def mouse_clicked(e)
    pane = scene.find("content_pane")
    
    pane.remove_all
    
    puts "self.scene_file: #{self.scene_file}"
    the_scene = self.scene_file
    pane.build do
      __install the_scene
    end
    
  end
  
end