module DirectionsTutorialLink
  attr_accessor :toc_link_id, :section_id
  
  def mouse_clicked(e)
    scene.find(@section_id).open_section
    scene.find(@toc_link_id).mouse_clicked(nil)
  end
end