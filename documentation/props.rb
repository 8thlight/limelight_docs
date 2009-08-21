header do
  logo :players => "image", :image => "images/logo.png"
end
  
table_of_contents do
  heading :text => "Contents"
  toc_heading :text => "Walkthroughs"
  toc_link :text => "Getting Started", :entrance => "getting_started"
  toc_link :text => "Creating Props", :entrance => "creating_props"
  toc_link :text => "Editing Styles", :entrance => "editing_styles"
end

content_pane :id => "content_pane"
