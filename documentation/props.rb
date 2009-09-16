header do
  logo :players => "image", :image => "images/logo.png"
end
  
table_of_contents do
  heading :text => "Contents"
  toc_heading :text => "Walkthroughs"
  toc_link :id => "getting_started_walkthrough",  :text => "Getting Started", :slideshow => "getting_started", :title => "Getting Started"
  toc_link :id => "creating_props_walkthrough",   :text => "Creating Props",  :slideshow => "creating_props", :title => "Creating Props"
  toc_link :id => "editing_styles_walkthrough",   :text => "Editing Styles",  :slideshow => "editing_styles", :title => "Editing Styles"
  toc_link :id => "prop_layout_walkthough",       :text => "Prop Layout",     :slideshow => "prop_layout", :title => "Prop Layout"
  toc_link :id => "prop_sizing_walkthough",       :text => "Prop Sizing",     :slideshow => "prop_sizing", :title => "Prop Sizing"
  toc_link :id => "colors_walkthrough",           :text => "Colors",          :slideshow => "colors", :title => "Colors"
  toc_link :id => "backgrounds_walkthrough",      :text => "Backgrounds",     :slideshow => "backgrounds", :title => "Backgrounds"
  toc_link :id => "gradients_walkthrough",        :text => "Gradients",       :slideshow => "gradients", :title => "Gradients"
  toc_link :id => "borders_walkthrough",          :text => "Borders",         :slideshow => "borders", :title => "Borders"
  toc_link :id => "insets_walkthrough",           :text => "Margin and Padding",  :slideshow => "insets", :title => "Insets"
  toc_link :id => "players_walkthrough",          :text => "Players",         :slideshow => "players", :title => "Players"
  toc_link :id => "images_walkthrough",           :text => "Images",          :slideshow => "images", :title => "Images"
  toc_link :id => "animations_walkthrough",       :text => "Animations",      :slideshow => "animations", :title => "Animations"
  toc_link :id => "productions_walkthrough",      :text => "Productions",     :slideshow => "productions", :title => "Productions"
  toc_link :id => "stages_walkthrough",           :text => "Stages",          :slideshow => "stages", :title => "Stages"
  
end

content_pane :id => "content_pane"