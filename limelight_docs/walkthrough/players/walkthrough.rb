module Walkthrough
  attr_accessor :slideshow
  
  def advance
    @slideshow.next
    update_canvas
  end
  
  def reverse
    @slideshow.previous
    update_canvas    
  end
  
  def update_canvas
    canvas = find("canvas")
    canvas.remove_all
    canvas << @slideshow.slide
  end
end