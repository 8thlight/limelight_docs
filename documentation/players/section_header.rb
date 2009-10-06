module SectionHeader
  attr_accessor :prop_to_remove
  
  def mouse_clicked(event)
    @controlled_prop = scene.find(@prop_to_remove)
    return if @controlled_prop.nil?
    
    if @controlled_prop.shrunk?
      @controlled_prop.grow
    else
      @controlled_prop.shrink
    end
  end
  
end