tutorial do
  __install "documentation/common/navigation_buttons.rb", :title => @title
  
  slideshow_progress :id => "slideshow_progress"
  slideshow :id => "slideshow" do
    __install "documentation/entrances/slideshow/#{@slideshow}.rb"
  end
end