slide do
  line_break
  directions :text => "A Prop can have a variety of backgrounds.  The background of a Prop is applied to the area within its borders (excluding its margin)."
end

slide do
  heading :text => "Background Color"
  directions :text => "Applies a flat color as the background."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  background_color :green"
    code :text => "}"
  end
  
  __install "documentation/entrances/colors_sandbox/colors_sandbox.rb"
end

slide do
  heading :text => "Background Image"
  directions :text => "Places an image as the background.  The filename of the image should be relative to the root directory of the Production."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  background_image \"images/homer_small.jpg\""
    code :text => "}"
  end
  
  __install "documentation/entrances/colors_sandbox/colors_sandbox.rb"
end

slide do
  heading :text => "Fill Strategy"
  directions :text => "There are two options for how to have the image fill the background."
  line_break
  directions :text => ":repeat - This is the default.  The image is tiled, beginning at the top left corner, inside the border."
  line_break
  directions :text => ":static - The image is painted once, starting at the top left corner, inside the border."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  background_image \"images/homer_small.jpg\""
    code :text => "  background_image_fill_strategy :static"
    code :text => "}"
  end

  __install "documentation/entrances/colors_sandbox/colors_sandbox.rb"
end

slide do
  heading :text => "Starting Coordinates"
  directions :text => "The starting coordinates for the background image can be specified.  The default is (0, 0), or the top left corner."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  background_image \"images/homer_small.jpg\""
    code :text => "  background_image_fill_strategy :static"
    code :text => "  background_image_x 200"
    code :text => "  background_image_y 30"
    code :text => "}"
  end

  __install "documentation/entrances/colors_sandbox/colors_sandbox.rb"
end

slide do
  heading :text => "Finished"
  directions :text => "Great!  Now you know all about Backgrounds.  When you're ready, head to the next tutorial."
end