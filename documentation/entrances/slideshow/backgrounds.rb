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
  heading :text => "Fill Strategies"
  directions :text => "These next few slides will cover the vairous ways you can have the image fill the background.  The default method is repeat.  You can try these strategies out using the sandbox on the next slide."
  line_break
  directions :text => "We will be using the background_image_fill_strategy style attribute"
  line_break
  directions :text => ":repeat - The image is tiled, beginning at the top left corner, inside the parent prop."
  line_break
  directions :text => ":repeat_x - The image is tiled from left to right, but will not repeat in the y direction"
  line_break
  directions :text => ":repeat_y - The image is tiled from top to bottom, but will not repeat in the x direction."
  line_break
  directions :text => ":static - The image is displayed once at the top left corner."
  line_break
  directions :text => ":scale - The image is tiled from left to right, but will not repeat in the y direction"
  line_break
  directions :text => ":scale_x - The image is tiled from top to bottom, but will not repeat in the x direction."
  line_break
  directions :text => ":scale_y - The image is tiled from top to bottom, but will not repeat in the x direction."
end

slide do
  heading :text => "Fill Strategy, Sandbox"
  directions :text => "Now you can try out the various fill strategies you learned on the previous slide."
  line_break
  directions :text => "Here is the list of the possible strategies again"
  line_break
  directions :text => ":repeat, :repeat_x, :repeat_y, :static, :scale, :scale_x, :scale_y"
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  background_image \"images/homer_small.jpg\""
    code :text => "  background_image_fill_strategy :repeat"
    code :text => "}"
  end

  __install "documentation/entrances/colors_sandbox/colors_sandbox.rb"
end

slide do
  heading :text => "Starting Coordinates"
  directions :text => "The starting coordinates for the background image can be specified as a number of pixels. The default is (0, 0), meaning the top left corner."
  
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
  heading :text => "Starting Coordinates, cont"
  directions :text => "The starting coordinates can also be specified as a symbol or percentage."
  line_break
  directions :text => "Symbol - background_image_x can take the values :left, :center or :right.  background_image_y can take the values :top, :center or :bottom"
  line_break
  directions :text => "Percentage - This shifts the image based on the percentage specified"
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  background_image \"images/homer_small.jpg\""
    code :text => "  background_image_fill_strategy :static"
    code :text => "  background_image_x \"50%\""
    code :text => "  background_image_y :center"
    code :text => "}"
  end

  __install "documentation/entrances/colors_sandbox/colors_sandbox.rb"
end

__install "documentation/common/finished_slide.rb"