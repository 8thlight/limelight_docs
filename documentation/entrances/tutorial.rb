tutorial do
  __install "documentation/common/navigation_buttons.rb", :title => @title
  
  slideshow_progress_wrapper do
    slideshow_progress :id => "slideshow_progress" do
      progress_text
      progress_bar :width => "100%"
    end
  end
  slideshow :id => "slideshow" do
    __install "documentation/entrances/slideshow/#{@slideshow}.rb"
  end
end