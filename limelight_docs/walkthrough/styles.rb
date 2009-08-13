# This file, (styles.rb) inside a scene, should define any styles specific to the containing scene.
# It makes use of the StyleBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#Styling_with_styles.rb
# For a complete listing of style attributes see: http://limelightwiki.8thlight.com/index.php/Style_Attributes

default_scene {
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

canvas {
  border_width 1
  border_color :black
}

step1 {
  font_size 28
}