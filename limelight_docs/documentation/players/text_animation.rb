module TextAnimation
  
  def label
    @label = scene.find("label") if @label.nil?
    return @label
  end
  
  def mouse_clicked(event)
    @animation.stop if @animation

    @target_x = event.x - self.child_area.x
    @target_y = event.y - self.child_area.y
    @target_x = 0 if @target_x < 0
    @target_y = 0 if @target_y < 0
    @dx = label.style.x.to_i < @target_x ? 1 : -1
    @dy = label.style.y.to_i < @target_y ? 1 : -1
    
    @animation = animate do
      if animation_complete?
        @animation.stop
      else
        label.style.x = (label.style.x.to_i + @dx).to_s if !x_movement_done?
        label.style.y = (label.style.y.to_i + @dy).to_s if !y_movement_done?
      end
    end
  end
  
  def animation_complete?
    x_movement_done? && y_movement_done?
  end
  
  def x_movement_done?
    label.style.x.to_i == @target_x
  end
  
  def y_movement_done?
    label.style.y.to_i == @target_y
  end
end