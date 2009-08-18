class Slideshow
  
  def initialize(canvas, previous_button, next_button)
    @canvas = canvas
    @slides = canvas.children
    @previous_button = previous_button
    clear_sideshow
    @current_slide = 0
    show_current_slide
  end
  
  def next
    clear_sideshow
    increment_current_slide
    show_current_slide
  end
    
  def previous
    clear_sideshow
    decrement_current_slide
    show_current_slide
  end
  
  def clear_sideshow
    @canvas.remove_all
  end
  
  def increment_current_slide
    @current_slide += 1 unless @current_slide >= (@slides.length - 1)
  end
  
  def decrement_current_slide
    @current_slide -= 1 unless @current_slide <= 0
  end
  
  def show_current_slide
    @canvas.add @slides[@current_slide]
  end
end