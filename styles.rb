darker_limegreen = "#82b91e"
dark_limegreen = "#8fc927"
light_limegreen = "#eaffbe"
compliment = "#b1226d"
light_compliment = "#d88b7a"
default_text_color = "#333"

header {
  width "100%"
  horizontal_alignment :center
}

heading {
  width "100%"
  horizontal_alignment :center
  font_size 22
  font_face "Arial Rounded MT Bold"
  text_color "#666"
  bottom_padding 10
}

canvas {
  width "100%"
  rounded_corner_radius 10
  secondary_background_color "#fff"
  background_color light_limegreen
  gradient :on
  gradient_angle 90
  gradient_penetration "25%"
  border_width 1
  border_color dark_limegreen
  padding 10
  margin 15
  height 200
}

content_pane {
  extends :canvas
  height 615
}

slide {
  height "100%"
}

directions {
  left_padding 10
  right_padding 10
  font_size 14
  font_face "Arial Rounded MT Bold"
  text_color "#666"
}

link_in_directions {
  extends :directions
  font_style :bold
  hover {
    text_color "#000"
  }
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

bold_code {
  extends :code
  font_style :bold
}

sandbox_codeblock {
  extends :codeblock
  hover
}

code_text_area {
  width "100%"
  margin "2%"
}

navigation_pane {
  bottom_padding 6
}

sandbox_editing_area {
  width "100%"
  horizontal_alignment :right
}

sandbox_button {
  horizontal_alignment :right
}

middle_navigation {
  horizontal_alignment :center
  vertical_alignment :center
  font_size 30
  font_face "Arial Rounded MT Bold"
  text_color "#666"
  height 44
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

list {
  top_padding 10
  left_padding 10 
}

list_item {
  extends :directions
  font_size 12
}

parent_prop {
  border_width  1
  border_color :black
}

box_with_child_with_margin {
  height 60
  width 60
}

child_prop {
  height 10
  width 10
}

full_size {
  width "100%"
  height "100%"
}

tiny_prop {
  border_width  1
  border_color :blue
  margin 3
  height 12
  width 12
}

style_error {
  text_color :red
  font_style :bold
  width "100%"
  font_size 16
  top_padding 4
}

big_label {
  font_size 36
  width "100%"
}

# RDoc styles
rdoc_canvas {
  height "100%"
  width "100%"
  vertical_scrollbar :on
}

rdoc_writable_area {
  right_padding 8
}

rdoc_font {
  font_face "Arial Rounded MT Bold"
  text_color "#666"
}

class_name {
  extends :rdoc_font
  font_size 20
  bottom_padding 10
  width "100%"
}

method {
  top_margin 5
  left_margin 5
  padding 8
  background_color :white
  rounded_corner_radius 20
}

method_header {
  width "100%"
  bottom_padding 8
}

method_name {
  extends :rdoc_font
  font_size 12
}

method_parameters {
  extends :method_name
  font_style :italic
}

public_methods_header {
  extends :rdoc_font
  font_size 14
  width "100%"
  bottom_padding 5
  top_padding 5
}

class_description {
  extends :directions
  font_size 10
  bottom_padding 5
}

method_description {
  extends :class_description
  left_margin 5
}

attributes_header {
  extends :public_methods_header
}

attributes {
  extends :method
}

attribute_header {
  extends :method_header
}

attribute_name {
  extends :method_name
}

attribute_description {
  extends :class_description
  left_padding 6
}

attribute_read_write {
  font_size 6
}