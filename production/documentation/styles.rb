darker_limegreen = "#82b91e"
dark_limegreen = "#8fc927"
light_limegreen = "#eaffbe"
compliment = "#b1226d"
light_compliment = "#d88b7a"
default_text_color = "#333"
light_grey = "#eee"

header {
  width "100%"
  horizontal_alignment :center
}

heading {
  width "100%"
  horizontal_alignment :center
  font_size 22
  font_face "Arial Rounded MT Bold"
  text_color default_text_color
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
#  height "85%"
}

directions {
  left_padding 10
  right_padding 10
  font_size 14
  font_face "Arial Rounded MT Bold"
  text_color default_text_color
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
#  bottom_padding 6
  width "100%"
  horizontal_alignment :center
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
  width "60%"
}

navigation_title {
  width "100%"
  horizontal_alignment :center
  top_padding 5
  bottom_padding 5
  font_size 23
  font_face "Arial Rounded MT Bold"
  text_color default_text_color
}

left_navigation {
  width "20%"
  padding 5
  horizontal_alignment :left
}

right_navigation {
  width "20%"
  padding 5
  horizontal_alignment :right
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
  width "100%"
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

wide_label {
  width "100%"
}

copyrights {
  width "100%"
  font_size 8
  text_color "#333"
  horizontal_alignment :center
  bottom_padding 3
}

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
  bottom_padding 3
  min_height 50
  height :greedy
}

scene_title {
  background_image "images/title.png"
  height 100
  width 200
}

activity_text {
  float :on
  x 5
  y 84
  text_color light_grey
  font_face "Arial Rounded MT Bold"
  font_size 10
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
  background_image_y 1
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

left_panel_cap {
  extends :panel_cap
  width "60%"
  top_right_rounded_corner_radius 0
  background_image_fill_strategy :static
  background_image_x :left
}

right_panel_cap {
  extends :panel_cap
  border_color "#aaa"
  left_border_width 1
  width "40%"
  top_left_rounded_corner_radius 0
  background_image_fill_strategy :static
  background_image_x :right
  background_color "#ccc"
}

panel_title {
#  font_style :bold
#  font_face "arial black"
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
#  padding 8
  horizontal_alignment :center
  text_color "#222"
  font_face "Arial Rounded MT Bold"
  hover {}
}

selected_toc_heading {
#  text_color "#222"
#  font_face "Arial Rounded MT Bold"
}

unselected_toc_heading {
#  text_color "#aaa"
#  font_face "Arial Rounded MT"
}

disabled_toc_heading {
  extends :unselected_toc_heading
  text_color "#aaa"
#  font_style :italic
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
  width "100%"
  horizontal_alignment :center
  margin 10
  padding 5
  font_face "Arial Rounded MT Bold"
  text_color default_text_color
  background_color light_limegreen
  rounded_corner_radius 5
  font_size 20
  background_image "images/top_glare_rr5.png"
  background_image_fill_strategy :scale_x
  background_image_x :right
  background_image_y 1
  hover {
    secondary_background_color dark_limegreen
    gradient_angle 270
    gradient :on
  }
}

class_header {
  extends :section_header
  hover {}
}

class_section {
  extends :section_links
}

selected_class_link {
  gradient :on
  background_color light_limegreen
  secondary_background_color darker_limegreen
  top_left_rounded_corner_radius 5
  bottom_left_rounded_corner_radius 5
  gradient_angle 270
}

class_link {  
  extends :toc_tutorial_link
  hover {
    extends :selected_class_link
  }
}

search_result_link {
  font_face "Arial Rounded MT Bold"
  text_color default_text_color
  font_size 12
  left_margin 3
  top_padding 2
  bottom_padding 2
}

selected_toc_item {
  extends :selected_class_link
}

heading {
        }

slideshow_progress_wrapper {
  width "100%"
  horizontal_alignment :center
}

slideshow_progress {
  height 12
  width "100%"
  background_color "#DDD"
  border_width 1
  border_color "#CCC"
  gradient :on
  secondary_background_color "#eee"
  background_color "#FFF"
}

progress_text {
  float :on
  width "100%"
  height "100%"
  horizontal_alignment :center
  vertical_alignment :center
  text_color default_text_color
  font_face "Arial Rounded MT Bold"
  font_size 10
}

progress_bar {
  float :on
  width "100%"
  height "100%"
  gradient :on
  background_color dark_limegreen
  secondary_background_color light_limegreen
}

search_area {
  left_padding "3"
  top_padding "5"
  vertical_alignment :center
}

search_text {
  width "87%"
  right_margin '1' 
}

search_results_screen {
  width "550"
  float :on
  x '15'
  y "162"
  padding 1
  border_width 1
  rounded_corner_radius 5
  border_color dark_limegreen
  background_color light_limegreen
  transparency "20%"
  max_height 300
  vertical_scrollbar :on
}

search_label {
  text_color dark_limegreen
  font_face "Arial Rounded MT Bold"
  font_size 10
  font_style "italic"
}

# RDoc styles
rdoc_canvas {
  width "100%"
  padding 5
}

rdoc_writable_area {
  right_padding 8
}

rdoc_font {
  font_face "Arial Rounded MT Bold"
  text_color default_text_color
}

rdoc_class_and_module_name {
  extends :rdoc_font
  font_size 20
  bottom_margin 20
  vertical_alignment :center
  left_padding 35
  width "100%"
  height "50"
  background_image_fill_strategy "static"
}

rdoc_class_name {
  extends :rdoc_class_and_module_name
  background_image "images/rdoc_class_icon.png"
}

rdoc_module_name {
  extends :rdoc_class_and_module_name
  background_image "images/rdoc_module_icon.png"
}

method {
  top_margin 5
  left_margin 5
  padding 8
  border_width 1
  border_color dark_limegreen
  background_color light_limegreen
  rounded_corner_radius 5
}

rdoc_header {
  width "100%"
  bottom_padding 8
}

method_header {
  width "100%"
  height 27
  background_image "images/rdoc_method_icon.png"
  background_image_fill_strategy "static"
  vertical_alignment :center
  left_padding 22
  bottom_margin 8
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
  left_padding 10
  right_padding 10
  font_face "Arial Rounded MT Bold"
  text_color default_text_color
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
  extends :rdoc_header
  height 27
  background_image "images/rdoc_attribute_icon.png"
  background_image_fill_strategy "static"
  vertical_alignment :center
  left_padding 22
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

rdoc_constant_header {
  extends :attributes_header
}

rdoc_constants {
  extends :attributes
}

rdoc_constant {
  extends :rdoc_header
  height 27
  background_image "images/rdoc_constant_icon.png"
  background_image_fill_strategy "static"
  vertical_alignment :center
  left_padding 22
}

rdoc_constant_name {
  extends :attribute_name
}

rdoc_constant_description {
  extends :attribute_description
}

rdoc_list {
  left_padding 10
}

rdoc_list_item {
  extends :class_description
  width "100%"
}

toggle_source {
  text_color dark_limegreen
  font_face "Arial Rounded MT Bold"
  font_size 10
  font_style "italic"
  hover {
    text_color compliment
  }
}

method_source_codeblock {
  height 0
#  margin 10
  padding 5
  border_color dark_limegreen
  border_width 1
  rounded_corner_radius 5
  background_color :white
}

search_result {
  height 18
  width "100%"
  vertical_alignment :center
  left_padding 7
  # hover {
  #   gradient :on
  #   background_color darker_limegreen
  #   secondary_background_color light_limegreen
  # }
}

search_result_message {
  extends :class_link
}
selected_result {
  gradient :on
  background_color darker_limegreen
  secondary_background_color light_limegreen
}