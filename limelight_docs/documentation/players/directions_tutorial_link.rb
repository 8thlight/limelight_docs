module DirectionsTutorialLink
  attr_accessor :toc_link_id
  
  def mouse_clicked(e)
    scene.find(@toc_link_id).mouse_clicked(nil)
  end
end