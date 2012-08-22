require 'entrance'

def shrinkable_parent?
  self.parent.players && self.parent.players.match(/shrinkable/) || self.parent.name == "shrinkable"
end

attr_accessor :class_name

on_mouse_clicked do
  Entrance.cue_rdoc(scene, scene.rdoc[@class_name])
  scene.select_toc_prop(self)
  self.parent.grow if shrinkable_parent?
end
