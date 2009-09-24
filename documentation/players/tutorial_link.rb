require 'entrance'

module TutorialLink
  attr_accessor :slideshow, :title, :toc_link_id
  
  def mouse_clicked(e)
    Entrance.cue_tutorial(scene, self.slideshow, self.title)
    
    scene.find_by_name("tutorial_link").each do |link|
      link.style.remove_extension(scene.styles['selected_toc_item'])
    end
    
    toc_link = scene.find(toc_link_id)
    toc_link.style.add_extension(scene.styles['selected_toc_item'])
  end
  
end