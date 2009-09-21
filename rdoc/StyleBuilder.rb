class_name :text => 'ClassName: Limelight::DSL::StyleBuilder'
class_description :text => 'The basis of the DSL for defining a Style object.'
public_methods_header :text => 'Public Methods'
method_name :text => 'extends'
method_description :text => '# Styles may extend other styles.
#
#    base {
#      background_color :red
#    }
#
#    cell {
#      extends :base
#      text_color :black
#    }
#
# The 'cell' style now has all attributes defined in 'base'.  Therefore any prop using the 'cell' style
# will have a red background.  Styles may override attributes aquired through extension.
#
'
method_name :text => 'hover'
method_description :text => '# Used to define a hover style.  Hover styles are appiled when the mouse passed over a prop using the specified style.
#
#   spinner {
#     width 50
#     height 50
#     hover {
#       text_color :white
#     }
#   }
#
# The text color of props using the 'spinner' style will become white when the mouse hovers over them.
#
'
