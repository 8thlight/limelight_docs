header do
  logo :players => "image", :image => "images/logo.png"
end
  
table_of_contents do

  toc_categories do
    toc_heading :id => "Walkthrough", :text => "Walkthroughs", :styles => "left_toc_heading, selected_toc_heading"
    toc_heading :id => "RDoc",:text => "RDoc", :styles => "right_toc_heading, disabled_toc_heading"
  end

  toc_links :id => "toc_links" do
    arbitrary_wrapper :id => "arbitrary_wrapper" do
      __install "documentation/walkthrough_links.rb"
    end
  end

end

content_pane :id => "content_pane" do
  middle_navigation :width => "100%", :text => "Welcome to Limelight"
  heading :text => "Choose one the of Tutorials on the left."
end