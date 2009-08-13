class Slideshow
  
  def initialize(props)
    @props = props
    @current_index = 0
  end
  
  def next
    @current_index += 1 unless @current_index >= (@props.length - 1)
  end
  
  def slide
    return @props[@current_index]
  end
  
  def previous
    @current_index -= 1 unless @current_index <= 0
  end
end