module ClassLink
  attr_accessor :class_prop_file
  
  def mouse_clicked(event)
    Entrance.cue_rdoc(scene, @class_prop_file)
  end
end