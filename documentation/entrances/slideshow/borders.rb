slide do
  line_break
  directions :text => "Borders are highly customizable in Limelight.  The days of needing Photoshop to create your rounded corners are over."
end

slide do
  heading :text => "Color and Width"
  directions :text => "As expected, a Prop's border color and width can be set.  In fact, each segment of the border is customizable."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  border_color :green"
    code :text => "  border_width 3"
    code :text => "}"
  end
  
  __install "documentation/common/styles_sandbox.rb", :height => 155, :prop => "prop :height => '100%', :width => '100%', :padding => 15, :text => \"Add a border.\""
end

slide do
  heading :text => "Color and Width"
  directions :text => "border_color and border_width will set all four sides of the border.  To set them individually, here is a full listing of the border styles."
  
  line_break
  directions :text => "Color"
  codeblock do
    code :text => "top_border_color, right_border_color, bottom_border_color, left_border_color"
  end
  
  directions :text => "Width"
  codeblock do
    code :text => "top_border_width, right_border_width, bottom_border_width, left_border_width"
  end
end

slide do
  heading :text => "Try it out!"
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  border_color :green"
    code :text => "  border_width 10"
    code :text => "  top_border_color :black"
    code :text => "  top_border_width 5"
    code :text => "}"
  end
  
  __install "documentation/common/styles_sandbox.rb", :height => 155, :prop => "prop :height => '100%', :width => '100%', :padding => 15, :text => \"Add a border, then check out the top border.\""
end

slide do
  heading :text => "Rounded Corners"
  directions :text => "Creating rounded corners is now as easy as just setting the rounded_corner_radius."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  border_color :red"
    code :text => "  border_width 1"
    code :text => "  rounded_corner_radius 20"
    code :text => "}"
  end
  
  __install "documentation/common/styles_sandbox.rb", :height => 155, :prop => "prop :padding => 15, :height => '100%', :width => '100%', :text => \"Add some rounded corners, then check out the top-right rounded corner.\""
end

slide do
  heading :text => "Rounded Corners - Radius"
  directions :text => "rounded_corner_radius will set all four corners of the border.  To set them individually, here is a full listing of the border styles."
  codeblock do
    code :text => "top_right_rounded_corner_radius"
    code :text => "bottom_right_rounded_corner_radius"
    code :text => "bottom_left_rounded_corner_radius"
    code :text => "top_left_rounded_corner_radius"
  end
end

slide do
  heading :text => "Rounded Corners - Color and Width"
  directions :text => "The color and width of each of the rounded corners can be set individually."
  codeblock do
    code :text => "top_right_border_width"
    code :text => "bottom_right_border_width"
    code :text => "bottom_left_border_width"
    code :text => "top_left_border_width"
    code :text => "top_right_border_color"
    code :text => "bottom_right_border_color"
    code :text => "bottom_left_border_color"
    code :text => "top_left_border_color"
  end
end

slide do
  heading :text => "Finished"
  directions :text => "That's all there is to it!  Now you know all about Borders.  When you're ready, head to the next tutorial."
end