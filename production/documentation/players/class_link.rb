module ClassLink
  attr_accessor :class_name
  
  def mouse_clicked(event)
    Entrance.cue_rdoc(scene, scene.rdoc[@class_name])
    scene.select_toc_prop(self)
    self.parent.grow if shrinkable_parent?
  end
  
  private ####################################
  
  def shrinkable_parent?
    self.parent.players && self.parent.players.match(/shrinkable/) || self.parent.name == "shrinkable"
  end
end