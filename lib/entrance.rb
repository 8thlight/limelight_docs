class Entrance
  
  def self.cue(scene, name)
    update_content_pane(scene, "documentation/entrances/#{name}.rb")
  end
  
  def self.cue_common(scene, name)
    update_content_pane(scene, "documentation/common/#{name}.rb")
  end
  
  def self.update_content_pane(scene, content)
    pane = scene.find("content_pane")    
    pane.remove_all
    
    pane.build do
      __install content
    end
  end
  
end
