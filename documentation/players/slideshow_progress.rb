module SlideshowProgress
  def observe
    update_content
  end
  
  def update_content
    self.text = "#{slideshow.current_slide_number}/#{slideshow.num_slides}"
  end
  
  def slideshow
    @slideshow = scene.find("slideshow") if @slideshow.nil?
    return @slideshow
  end
end