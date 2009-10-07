documentation {
  width "100%"
  height "100%"
  top_padding 20
  left_padding 20
  background_image "images/splash.png"
}

toggle_source {
  text_color "#333"
  hover {
    text_color "#555"
  }
}

method_source_codeblock {
  height 0
  margin 10
  padding 10
  border_color "black"
  border_width 1
  # background_color "#E9F6D5"
  background_color "#F5F5F5"
}

content_pane {
  width "562"
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

toc_links {
  height "100%"
  vertical_scrollbar :on
}

toc_item {
  width "100%"
  font_face "Arial Rounded MT Bold"
  text_color "#666"
}

toc_categories {
  extends :toc_item
  bottom_margin 3
}

toc_heading {
  padding 8
  font_size 14
  hover {}
}

left_toc_heading {
  top_left_rounded_corner_radius 20
  width "65%"
}

right_toc_heading {
  border_color "#AAA"
  left_border_width 1
  top_right_rounded_corner_radius 20
  width "35%"
}

selected_toc_heading {
  text_color "#222"
  font_face "Arial Rounded MT Bold"
  background_color "#D8F0BB"
}

unselected_toc_heading {
  text_color "#222"
  font_face "Arial Rounded MT"
  bottom_border_width 1
  border_color "#AAA"
  background_color "#DDD"
}

disabled_toc_heading {
  extends :unselected_toc_heading
  text_color "#AAA"
  font_style :italic
}

section_header {
  extends :toc_item
  left_padding 16
  left_margin 3
  top_padding 5
  bottom_padding 4
  background_image "images/arrow_right.png"
  background_image_fill_strategy :static
  background_image_y :center
  hover {}
}

toc_tutorial_link {
  extends :toc_item
  left_padding 16
  font_size 12
  left_margin 3
  top_padding 2
  bottom_padding 2
  hover {
    text_color "#000"
  }
}

section_links {
  left_padding 19
}

directions_tutorial_link {
  extends :directions
  font_style :italic
  hover {
    text_color "#000"
  }
}

class_header {
  extends :section_header
  hover {}
}

class_section {
  extends :section_links
}

class_link {
  extends :toc_tutorial_link
  hover {
    text_color "#000"
  }
}

selected_toc_item {
  background_color "#85cd16"
}
