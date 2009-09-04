require 'entrance'

module TocLink
  attr_accessor :entrance
  
  def mouse_clicked(e)
    Entrance.cue(scene, self.entrance)
    
    scene.find_by_name("toc_link").each do |link|
      link.style.remove_extension(scene.styles['selected_toc_item'])
    end
    
    style.add_extension(scene.styles['selected_toc_item'])
  end
  
end