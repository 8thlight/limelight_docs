header do
  logo :players => "image", :image => "images/logo.png"
end
  
table_of_contents do
  heading :text => "Contents"
  toc_heading :text => "Walkthroughs"
  toc_link :id => "getting_started_walkthrough", :text => "Getting Started", :entrance => "getting_started"
  toc_link :id => "creating_props_walkthrough", :text => "Creating Props", :entrance => "creating_props"
  toc_link :id => "editing_styles_walkthrough", :text => "Editing Styles", :entrance => "editing_styles"
  toc_link :id => "productions_walkthrough", :text => "Productions", :entrance => "productions"
end

content_pane :id => "content_pane"
