module SampleAnimation
  
  def label
    @label = scene.find_by_name("label").first if @label.nil?
    return @label
  end
  
  def mouse_clicked(e)
    @animation.stop if @animation
    @target_x = e.x
    @target_y = e.y
    @dx = label.style.x.to_i < e.x ? 1 : -1
    @dy = label.style.y.to_i < e.y ? 1 : -1
    
    puts "label: #{label}"
    
    @animation = animate do
      on_x = label.style.x.to_i == e.x
      on_y = label.style.y.to_i == e.y
      if on_x && on_y
        puts "stop"
        @animation.stop
      else
        label.style.x = (label.style.x.to_i + @dx).to_s if !on_x
        label.style.y = (label.style.y.to_i + @dy).to_s if !on_y
      end
    end
  end
  
end