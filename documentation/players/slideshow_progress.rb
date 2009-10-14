module SlideshowProgress
  def update_content
    self.text = "#{slideshow.current_slide}/#{slideshow.num_slides}"
  end
  
  def slideshow
    @slideshow = scene.find("slideshow") if @slideshow.nil?
    return @slideshow
  end
end