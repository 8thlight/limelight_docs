module TextAnimation
  
  def label
    @label = scene.find("label") if @label.nil?
    return @label
  end
  
  def mouse_clicked(e)
    @animation.stop if @animation
    
    @target_x = e.x - self.child_area.x
    @target_y = e.y - self.child_area.y
    
    @dx = label.style.x.to_i < @target_x ? 1 : -1
    @dy = label.style.y.to_i < @target_y ? 1 : -1
    
    @animation = animate do
      on_x = label.style.x.to_i == @target_x
      on_y = label.style.y.to_i == @target_y
      if on_x && on_y
        @animation.stop
      else
        label.style.x = (label.style.x.to_i + @dx).to_s if !on_x
        label.style.y = (label.style.y.to_i + @dy).to_s if !on_y
      end
    end
  end
  
end