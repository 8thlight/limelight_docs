require 'entrance'

module TutorialLink
  
  attr_accessor :slideshow, :title
  
  def mouse_clicked(e)
    Entrance.cue_tutorial(scene, self.slideshow, self.title)
    scene.select_toc_prop(self)
    slideshow_progress = scene.find("slideshow_progress")
    slideshow_progress.update_content
    scene.find("slideshow").register_progress_observer(slideshow_progress)
  end
  
end