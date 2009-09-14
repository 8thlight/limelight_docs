slide do
  line_break
  directions :text => "A Production may have one or more stages.  Stages represent windows on the desktop."
  line_break
  directions :text => "Each stage can have a name, size, location, and may display any Scene."
end

slide do
  heading :text => "Single Stage"
  directions :text => "Stages are specified and configured in the stages.rb file."
  line_break
  code :text => "stage \"main\" do"
  code :text => "  default_scene \"first_scene\""
  code :text => "  title \"Main Stage\""
  code :text => "  location [0, 0]"
  code :text => "  size [300, 800]"
  code :text => "end"
  line_break
  directions :text => "In this example, a single stage has been specified. Upon startup, one window will be displayed .  Its title of \"Main Stage\" will be visible at the top of the window."
  line_break
  directions :text => "It will be located at the top-left corner of the screen, and it will have a width of 300 pixels and a height of 800 pixels."
  line_break
  directions :text => "Its default_scene is set to \"first_scene\", which means that when the Production is loaded, the Scene named \"first_scene\" will be loaded into this stage."
end

slide do
  heading :text => "Multiple Stages"
  directions :text => "In this next example, two stages have been specified."
  line_break
  code :text => "stage \"main\" do"
  code :text => "  default_scene \"first_scene\""
  code :text => "  title \"Main Stage\""
  code :text => "  location [0, 0]"
  code :text => "  size [300, 800]"
  code :text => "end"
  line_break
  code :text => "stage \"side\" do"
  code :text => "  default_scene \"second_scene\""
  code :text => "  title \"Side Stage\""
  code :text => "  location [350, 0]"
  code :text => "  size [200, 200]"
  code :text => "end"
  line_break
  directions :text => "In this example, two windows will be shown at startup."
  line_break
  directions :text => "The first will have a title of \"Main Stage\", appear in the top-left corner of the screen, and the Scene named \"first_scene\" will be loaded."
  line_break
  directions :text => "The second window will have a title of \"Side Stage\".  It will appear at the top of the screen, but 350 pixels to the right of the top-left corner.  The Scene named \"second_scene\" will be loaded.  If you do not specify this, the stage will not display at startup."
end

slide do
  heading :text => "Location"
  directions :text => "The location of the stage can be specified with integers as seen in previous examples.  You can also specify them using the style syntax."
  line_break
  code :text => "stage \"main\" do"
  code :text => "  location [:top, :left]"
  code :text => "end"
  
  line_break
  directions :text => "This is the same as specifying [0, 0] for the location.  "
  line_break
  directions :text => "Valid symbols are:"
  line_break
  directions :text => "+ Vertical - :top, :center and :bottom"
  line_break
  directions :text => "+ Horizontal - :left, :center, and :right"
end

slide do
  heading :text => "Size"
  directions :text => "Size can be specified as number of pixels as seen in previous examples.  You can also specify the size using a percentage or as auto."
  line_break
  code :text => "stage \"main\" do"
  code :text => "  size [\"50%\", \"50%\"]"
  code :text => "end"
end

slide do
  heading :text => "Fullscreen"
  directions :text => "When a stage is set to be fullscreen, it will fill the entire screen and appear on top of all other windows."
  line_break
  code :text => "stage \"main\" do"
  code :text => "  fullscreen true"
  code :text => "end"
end

slide do
  heading :text => "Kiosk Mode"
  directions :text => "When a stage is set to be in kiosk mode, it will appear as fullscreen with no frames and with the following OS keys disabled."
  line_break
  directions :text => "  * Mac OS X: Cmd-Tab, Cmd-Alt-Esc, etc..."
  directions :text => "  * Windows: Alt-Tab, Ctrl-Esc, etc... (Ctrl-Alt-Del must be disabled through a registry entry)"
  line_break
  code :text => "stage \"main\" do"
  code :text => "  kiosk true"
  code :text => "end"
end

slide do
  heading :text => "Framed"
  directions :text => "When set to true (the default), the stage will be framed with the operating system's standard window frame, including the close, minimize and maximize buttons."
  line_break
  directions :text => "To hide these buttons and remove the framing, set framed to false."
  line_break
  code :text => "stage \"main\" do"
  code :text => "  framed false"
  code :text => "end"
end

slide do
  heading :text => "Background Color"
  directions :text => "Set this to a color to change the background color of the entire stage."
  line_break
  code :text => "stage \"main\" do"
  code :text => "  background_color :red"
  code :text => "end"
end

slide do
  heading :text => "Always on Top"
  directions :text => "When set to true, the stage will remain on top of all other windows."
  line_break
  code :text => "stage \"main\" do"
  code :text => "  always_on_top true"
  code :text => "end"
end

slide do
  heading :text => "Accessing a Stage from Code"
  directions :text => "The Theater object has a convenient way of allowing access to any stage, assuming that the name is known."
  directions :text => "Assuming that there is a stage with a name of \"main\", it could be accessed like this:"
  line_break
  code :text => "main_theater = production.theater[\"main\"]"
end

slide do
  heading :text => "Finished"
  directions :text => "Great!  Now you know all about Stages.  When you're ready, head to the next tutorial."
end