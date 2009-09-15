slide do
  line_break
  directions :text => "Borders are highly customizable in Limelight.  The days of needing Photoshop to create your rounded corners are over."
end

slide do
  heading :text => "Color and Width"
  directions :text => "As expected, a Prop's border color and width can be set.  In fact, each segment of the border is customizable."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  border_color :red"
    code :text => "  border_width 4"
    code :text => "  top_border_color :green"
    code :text => "  top_border_width 12"
    code :text => "}"
  end
  
  __install "documentation/common/styles_sandbox.rb", :height => 155, :prop => "prop :height => '100%', :width => '100%', :text => \"Add a border, then check out the top border.\""
end

slide do
  heading :text => "Rounded Corners"
  directions :text => "Creating rounded corners is now as easy as just setting the radius."
  line_break
  directions :text => "Just like border width and color, all four corners can be set independently"
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  border_color :red"
    code :text => "  border_width 1"
    code :text => "  rounded_corner_radius 20"
    code :text => "  top_right_rounded_corner_radius 5"
    code :text => "  top_right_border_width 5"
    code :text => "}"
  end
  
  __install "documentation/common/styles_sandbox.rb", :height => 155, :prop => "prop :padding => 15, :height => '100%', :width => '100%', :text => \"Add some rounded corners, then check out the top-right rounded corner.\""
end

slide do
  heading :text => "Finished"
  directions :text => "That's all there is to it!  Now you know all about Borders.  When you're ready, head to the next tutorial."
end