darker_limegreen = "#82b91e"
dark_limegreen = "#8fc927"
light_limegreen = "#eaffbe"
compliment = "#b1226d"
light_compliment = "#d88b7a"
default_text_color = "#333"

documentation {
  background_color light_limegreen
  background_image "images/pinstripes.png"
  horizontal_alignment :center
  vertical_alignment :top
  width "100%"
  height "100%"
}

title_bar {
  background_color "#c3ea6f"
  secondary_background_color darker_limegreen
  gradient :on
  gradient_angle 270
  height 100
  width "100%"
  border_color "#777"
  bottom_border_width 1
  horizontal_alignment :center
  vertical_alignment :center
}

main_body {
  width "100%"
  padding 10
  min_height 50
  height :greedy
}

scene_title {
  background_image "images/title.png"
  height 100
  width 200
}

panel {
  width "100%"
  height "100%"
}

panel_cap {
  background_color dark_limegreen
  background_image "images/top_glare_rr5.png"
  background_image_fill_strategy :scale_x
  background_image_x :right
  background_image_y :top
  top_rounded_corner_radius 5
  height 20
  width "100%"
  vertical_alignment :center
  left_padding 5
  right_padding 5
}

tabbed_panel_cap {
  extends :panel_cap
  padding 0
}

panel_title {
  font_style :bold
  font_face "arial black"
  text_color default_text_color
}

panel_body {
  background_color :white
  width "100%"
  min_height 50
  height :greedy
  border_color dark_limegreen
  bottom_left_rounded_corner_radius 5
  border_width 1
  top_border_width 0
}

navigation_column {
  width "25%"
}

main_column {
  left_margin 10
  width "75%"
  min_height 50
  height "100%"
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
  width "100%"
  vertical_scrollbar :on
}

toc_item {
  width "100%"
  font_face "Arial Rounded MT Bold"
  text_color default_text_color
}

toc_categories {
  extends :toc_item
  bottom_margin 3
}

toc_heading {
  padding 8
  horizontal_alignment :center
  hover {}
}

left_toc_heading {
  width "60%"
}

right_toc_heading {
  border_color "#aaa"
  left_border_width 1
  width "40%"
}

selected_toc_heading {
  text_color "#222"
  font_face "Arial Rounded MT Bold"
}

unselected_toc_heading {
  text_color "#aaa"
  font_face "Arial Rounded MT"
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
  top_left_rounded_corner_radius 5
  bottom_left_rounded_corner_radius 5
  background_color light_limegreen
  secondary_background_color darker_limegreen
  gradient_angle 270
  gradient :on
}

middle_navigation {
  width "100%"
  top_padding 5
}

heading {
}
