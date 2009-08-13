class Slideshow
  
  def initialize(props)
    @props = props
    @current_slide = 0
    hide_unshown_slides
  end
  
  def next
    increment_current_slide
    show_current_slide
    hide_unshown_slides
  end
  
  def previous
    decrement_current_slide
    show_current_slide
    hide_unshown_slides
  end
  
  def hide_unshown_slides
    @props[(@current_slide + 1)..-1].each { |prop| prop.style.transparency = "100%" }
    @props[(@current_slide - 1)..0].each { |prop| prop.style.transparency = "100%" }
  end
  
  def increment_current_slide
    @current_slide += 1 unless @current_slide >= (@props.length - 1)
  end
  
  def decrement_current_slide
    @current_slide -= 1 unless @current_slide <= 0
  end
  
  def show_current_slide
    @props[@current_slide].style.transparency = "0%"
  end
end