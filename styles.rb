# This file, (styles.rb) in the root directory of the production, should define any styles that are used in multiple
# scenes.  It makes use of the StyleBuilder DSL.

heading {
  width "100%"
  horizontal_alignment :center
  font_size 25
  font_face "Arial Rounded MT Bold"
  text_color "#666"
}

header {
  width "100%"
  horizontal_alignment :center
}

default_scene {
  width "100%"
  height "100%"
  top_padding 20
  left_padding 20
  background_image "images/splash.png"
}

canvas {
  width "100%"
  margin 20
  rounded_corner_radius 20
  background_color "#fffa"
  secondary_background_color "#fff6"
  gradient :on
  gradient_angle 270
  padding 10
}

directions {
  font_size 14
  font_face "Arial Rounded MT Bold"
  text_color "#666"
  margin 10
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
}

codeblock {
  width "100%"
  top_padding 10
  bottom_padding 10
  left_padding 30
}

code {
  width "100%"
  font_face "Terminal"
}

previous_button {
  width "91%"
}

screenshot_div {
  width "100%"
  horizontal_alignment :center
}