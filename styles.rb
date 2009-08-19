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
  left_margin 15
}

walkthrough {
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
  font_size 10
}

navigation {
  width "100%"
}

navigation_button {
  
}

previous_button {
  horizontal_alignment :left
}

next_button {
  width 450
  horizontal_alignment :right
}

screenshot_div {
  width "100%"
  top_padding 15
  horizontal_alignment :center
}
