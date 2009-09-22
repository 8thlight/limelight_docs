class_name :text => 'ClassName: Limelight::DSL::StyleBuilder'
class_description :text => 'The basis of the DSL for defining a Style object.'
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'extends'
method_parameters :text => '(*style_names)'
end
method_description :text => 'Styles may extend other styles.'
codeblock do
code :text => '    base {'
code :text => '      background_color :red'
code :text => '    }'
end
codeblock do
code :text => '    cell {'
code :text => '      extends :base'
code :text => '      text_color :black'
code :text => '    }'
end
method_description :text => 'The \'cell\' style now has all attributes defined in \'base\'.  Therefore any prop using the \'cell\' style will have a red background.  Styles may override attributes aquired through extension.'
end
method do
method_header do
method_name :text => 'hover'
method_parameters :text => '(&block)'
end
method_description :text => 'Used to define a hover style.  Hover styles are appiled when the mouse passed over a prop using the specified style.'
codeblock do
code :text => '   spinner {'
code :text => '     width 50'
code :text => '     height 50'
code :text => '     hover {'
code :text => '       text_color :white'
code :text => '     }'
code :text => '   }'
end
method_description :text => 'The text color of props using the \'spinner\' style will become white when the mouse hovers over them.'
end
