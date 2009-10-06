module ClassLink
  attr_accessor :class_name
  
  def mouse_clicked(event)
    Entrance.cue_rdoc(scene, scene.rdoc[@class_name])
    scene.select_toc_prop(self)
  end
end