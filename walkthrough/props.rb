# This file (props.rb) defines all the props that appear in a scene when loaded.  It makes use of the
# PropBuilder DSL.
#
# For more information see: http://limelightwiki.8thlight.com/index.php/A_Cook%27s_Tour_of_Limelight#PropBuilder_DSL

previous_button :id => "previous"
logo
next_button :id => "next"
canvas :id => "canvas" do
  step :id => "slide1", :text => "Install JRuby Jim"
  step :id => "slide2", :text => "Make sure it works"
end