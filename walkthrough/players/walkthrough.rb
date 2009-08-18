module Walkthrough
  def casted
    @slideshow = Slideshow.new(find("slideshow"), find("previous"), find("next"))
    puts "@slideshow: #{@slideshow}"
  end
  
  def advance
    @slideshow.next
  end
  
  def reverse
    @slideshow.previous  
  end
end