class Entrance
  def self.cue(scene, name)
    pane = scene.find("content_pane")    
    pane.remove_all
    
    the_entrance = "documentation/entrances/#{name}.rb"
    pane.build do
      __install the_entrance
    end
  end
end
