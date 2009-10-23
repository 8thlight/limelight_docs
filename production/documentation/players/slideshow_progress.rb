module SlideshowProgress
  def observe
    update_content
  end
  
  def update_content
    self.children[1].text = "Step #{slideshow.current_slide_number}/#{slideshow.num_slides}"
    self.children[0].style.width = "#{percent_complete}%"
  end
  
  def percent_complete
    return 0 if slideshow.num_slides == 0
    return (slideshow.current_slide_number.to_f/slideshow.num_slides) * 100
  end
  
  def slideshow
    @slideshow = scene.find("slideshow") if @slideshow.nil?
    return @slideshow
  end
end