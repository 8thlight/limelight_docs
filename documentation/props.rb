header do
  logo :players => "image", :image => "images/logo.png"
end
  
table_of_contents do
  toc_categories do
    toc_heading :id => "Walkthrough", :text => "Walkthroughs", :styles => "left_toc_heading, selected_toc_heading"
    toc_heading :id => "RDoc",:text => "RDoc", :styles => "unselected_toc_heading", :styles => "right_toc_heading, unselected_toc_heading"
  end
  
  toc_links :id => "toc_links" do
    __install "documentation/walkthrough_links.rb"
  end

end

content_pane :id => "content_pane"