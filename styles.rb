header {
  width "100%"
  horizontal_alignment :center
}

heading {
  width "100%"
  horizontal_alignment :center
  font_size 25
  font_face "Arial Rounded MT Bold"
  text_color "#666"
  bottom_padding 10
}

canvas {
  width "100%"
  rounded_corner_radius 20
  background_color "#fffa"
  secondary_background_color "#fff6"
  gradient :on
  gradient_angle 270
  padding 15
  margin 15
  height 200
}

tutorial {
  extends :canvas
  height 600
}

slide {
  height "100%"
}

directions {
  font_size 14
  font_face "Arial Rounded MT Bold"
  text_color "#666"
}

directions_text {
  font_size 10
  font_face "Arial Rounded MT Bold"
  text_color "#666"
  bottom_margin "8"
}

line_break {
  width "100%"
  bottom_padding 10
}

jruby_button {
  width "100%"
  horizontal_alignment :center
}

green_button {
  font_size 28
  background_color "#59A615"
  text_color :white
  font_style :bold
  font_face "Helvetica"
  top_margin 10
  top_padding 7
  bottom_padding 7
  left_padding 15
  right_padding 15
  rounded_corner_radius 12
  
  hover {
    text_color "#9CFF88"
  }
}

codeblock {
  width "100%"
  top_padding 10
  bottom_padding 10
  left_padding 30
}

code {
  width "100%"
  font_face "Courier New"
  font_size 12  
}

sandbox_codeblock {
  extends :codeblock
  hover
}

navigation_buttons {
  width 62
  height 44
}

previous_button {
  extends :navigation_buttons
  background_image "images/previous.png"
  hover
}

next_button {
  extends :navigation_buttons
  background_image "images/next.png"
  hover
}

screenshot_div {
  width "100%"
  top_padding 15
  horizontal_alignment :center
}
