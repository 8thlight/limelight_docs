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
  code :text => "  title \"Side Stage\""
  code :text => "  location [350, 0]"
  code :text => "  size [200, 200]"
  code :text => "end"
  line_break
  directions :text => "In this example, two windows will be shown at startup."
  line_break
  directions :text => "The first will have a title of \"Main Stage\", appear in the top-left corner of the screen, and the Scene named \"first_scene\" will be loaded."
  line_break
  directions :text => "The second window will have a title of \"Side Stage\".  It will appear at the top of the screen, but 350 pixels to the right of the top-left corner.  No scene will be loaded at startup."
  
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
  heading :text => "Finished"
  directions :text => "Great!  Now you know all about Stages.  When you're ready, head to the next tutorial."
end