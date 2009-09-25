module ClassLink
  attr_accessor :class_prop_file
  
  def mouse_clicked(event)
    Entrance.cue_rdoc(scene, scene.production.rdoc[self.text])
  end
end