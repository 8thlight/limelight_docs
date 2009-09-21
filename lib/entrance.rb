class Entrance
  
  def self.cue_tutorial(scene, slideshow, title=nil)
    update_content_pane(scene, "entrances", "tutorial", {:slideshow => slideshow, :title => title})
  end
    
  def self.cue_common(scene, name)
    update_content_pane(scene, "common", name)
  end
  
  def self.update_content_pane(scene, folder, name, options={})
    pane = scene.find("content_pane")    
    pane.remove_all
    
    pane.build do
      __install "documentation/#{folder}/#{name}.rb", options
    end
  end
  
end
