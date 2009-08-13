module Walkthrough
  attr_accessor :navigator
  
  def advance_forward
    scene.navigator.next
    canvas = scene.find("canvas")
    if scene.navigator.slide
      canvas.remove_all
      canvas << scene.navigator.slide
    end
  end
end