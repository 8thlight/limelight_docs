module Walkthrough
  attr_accessor :slideshow
  
  def advance
    @slideshow.next
  end
  
  def reverse
    @slideshow.previous  
  end
end