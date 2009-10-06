module SectionHeader
  attr_accessor :prop_to_remove
  
  def mouse_clicked(event)
    @controlled_prop = scene.find(@prop_to_remove)
    return if @controlled_prop.nil?
    
    if @controlled_prop.shrunk?
      @controlled_prop.grow
      self.style.background_image = "images/arrow_down.png"
    else
      @controlled_prop.shrink
      self.style.background_image = "images/arrow_right.png"
    end
  end
  
end