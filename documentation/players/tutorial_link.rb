require 'entrance'

module TutorialLink
  
  attr_accessor :slideshow, :title, :toc_link_id
  
  def mouse_clicked(e)
    Entrance.cue_tutorial(scene, self.slideshow, self.title)
    scene.select_toc_prop(self)
  end
  
end