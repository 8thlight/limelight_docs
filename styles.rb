# This file, (styles.rb) in the root directory of the production, should define any styles that are used in multiple
# scenes.  It makes use of the StyleBuilder DSL.

heading {
  width "100%"
  horizontal_alignment :center
  font_size 25
  font_face "Arial Rounded MT Bold"
  text_color "#666"
  margin 25
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