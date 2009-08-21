module Slideshow

  def casted
    @current_slide = 0
    @slides = self.children
    @previous_button = scene.find("previous")
    @next_button = scene.find("next")
    update_slideshow { @current_slide = 0 }
  end
  
  def next
    update_slideshow { increment_current_slide }
  end
  
  def previous
    update_slideshow { decrement_current_slide }
  end
  
  def update_slideshow
    clear_sideshow
    yield
    update_arrows
    show_current_slide
  end
  
  def clear_sideshow
    self.remove_all
  end
  
  def increment_current_slide
    @current_slide += 1 unless at_end?
  end
  
  def decrement_current_slide
    @current_slide -= 1 unless at_beginning?
  end
  
  def show_current_slide
    self.add @slides[@current_slide] if @slides[@current_slide]
  end
  
  def update_arrows
    update_previous_button
    update_next_button
  end
  
  def update_previous_button
    if at_beginning?
      @previous_button.style.transparency = "100%"
    else
      @previous_button.style.transparency = "0%"
    end
  end
  
  def update_next_button
    if at_end?
      @next_button.style.transparency = "100%"
    else
      @next_button.style.transparency = "0%"
    end
  end
  
  def at_end?
    @current_slide >= (@slides.length - 1)
  end
  
  def at_beginning?
    @current_slide <= 0
  end
end