require 'entrance'

module TutorialLink
  attr_accessor :slideshow, :title
  
  def mouse_clicked(e)
    Entrance.cue_tutorial(scene, self.slideshow, self.title)
    
    scene.find_by_name("tutorial_link").each do |link|
      link.style.remove_extension(scene.styles['selected_toc_item'])
    end
    
    style.add_extension(scene.styles['selected_toc_item'])
  end
  
end