module ClassLink
  attr_accessor :klass_name
  
  def mouse_clicked(event)
    Entrance.cue_rdoc(scene, @klass_name)
  end
end