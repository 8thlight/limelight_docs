require 'entrance'

module TocLink
  attr_accessor :entrance
  
  def mouse_clicked(e)
    Entrance.cue(scene, self.entrance)
  end
  
end