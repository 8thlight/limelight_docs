# This file, (styles.rb) inside a scene, should define any styles specific to the containing scene.
# It makes use of the StyleBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#Styling_with_styles.rb
# For a complete listing of style attributes see: http://limelightwiki.8thlight.com/index.php/Style_Attributes

walkthrough {
  width "100%"
  height "100%"
  top_padding 20
  left_padding 20
  background_image "images/splash.png"
}

previous_button {
  width 150
  height 100
  right_margin 50 
  background_color :blue
}

logo {
  background_image "images/logo.png"
  width 450
  right_margin 50
  height 110
}

next_button {
  width 150
  height 100
  left_margin 50
  background_color :white  
}

slideshow {
  width "100%"
  margin 20
  rounded_corner_radius 20
  background_color "#fffa"
  secondary_background_color "#fff6"
  gradient :on
  gradient_angle 270
  padding 10
  horizontal_alignment :center
}

directions {
  width "100%"
  horizontal_alignment :center
  font_size 25
  font_face "Arial Rounded MT Bold"
  text_color "#666"
  margin 25
}

directions_specific {
  width "100%"
  horizontal_alignment :center
  font_size 14
  font_face "Arial Rounded MT Bold"
  text_color "#666"
  margin 10
}