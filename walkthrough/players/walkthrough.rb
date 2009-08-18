module Walkthrough
  def casted
    @slideshow = Slideshow.new(scene.find("slideshow"), scene.find("previous"), scene.find("next"))
  end
  
  def advance
    @slideshow.next
  end
  
  def reverse
    @slideshow.previous  
  end
  
end