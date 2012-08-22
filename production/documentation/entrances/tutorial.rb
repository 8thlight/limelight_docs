tutorial do
  __install "#{Dir.pwd}/production/documentation/common/navigation_buttons.rb", :title => @title
  
  slideshow :id => "slideshow" do
    __install "#{Dir.pwd}/production/documentation/entrances/slideshow/#{@slideshow}.rb"
  end
end
