walkthrough do
  __install "documentation/common/navigation_buttons.rb"
  
  slideshow :id => "slideshow" do
    __install "documentation/entrances/slideshow/#{@slideshow}.rb"
  end
  
  # slideshow :id => "slideshow" do  
  #   
  #   slide do
  #     heading :text => "Show me show me show me"
  #   end
  #   
  #   slide do
  #     heading :text => "Yes you are right"
  #   end
  # end  
end