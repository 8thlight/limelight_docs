documentation {
  width "100%"
  height "100%"
  top_padding 20
  left_padding 20
  background_image "images/splash.png"
}

table_of_contents {
  height "600"
  width "200"
  rounded_corner_radius 20
  background_color "#fffa"
  secondary_background_color "#fff6"
  gradient :on
  gradient_angle 270
}

content_pane {
  width "562"
}

toc_item {
  width "100%"
  font_face "Arial Rounded MT Bold"
  text_color "#666"
}

toc_heading {
  extends :toc_item
  font_size 16
  left_padding 8
  top_padding 8
}

toc_link {
  extends :toc_item
  font_size 12
  left_padding 16
  top_padding 4
  hover {
    text_color "#000"
  }
}