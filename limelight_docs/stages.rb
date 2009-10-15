stage "default" do
  default_scene "documentation"
  title "Limelight Documentation"
  location [:center, :center]
  size [800, 800]
end

# stage "test" do
#   default_scene "documentation"
#   title "Limelight Docs"
#   location [:left, :top]
#   size [800, 800]
# end
# 
stage "devtool" do
 default_scene "devtool"
 title "Dev Tool"
 location [50, 25]
 size [100, 100]
 background_color "transparent"
 framed false
end
