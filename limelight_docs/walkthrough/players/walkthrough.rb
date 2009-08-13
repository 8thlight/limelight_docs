module Walkthrough
  attr_accessor :navigator
  
  def advance
    @navigator.next
    update_canvas
  end
  
  def reverse
    @navigator.previous
    update_canvas    
  end
  
  def update_canvas
    canvas = find("canvas")
    canvas.remove_all
    canvas << @navigator.slide
  end
end