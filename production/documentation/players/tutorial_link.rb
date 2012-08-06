require 'entrance'


prop_reader :slideshow, :title

on_mouse_clicked(e) do
  Entrance.cue_tutorial(scene, slideshow, title)
  scene.select_toc_prop(self)
  slideshow_progress = scene.find("slideshow_progress")
  slideshow_progress.update_content
  scene.find("slideshow").register_progress_observer(slideshow_progress)
end

