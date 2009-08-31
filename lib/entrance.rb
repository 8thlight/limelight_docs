class Entrance
  
  def self.cue(scene, name)
    update_content_pane(scene, "entrances", name)
  end
  
  def self.cue_common(scene, name)
    update_content_pane(scene, "common", name)
  end
  
  def self.update_content_pane(scene, folder, name)
    pane = scene.find("content_pane")    
    pane.remove_all
    
    pane.build do
      __install "documentation/#{folder}/#{name}.rb"
    end
  end
  
end
