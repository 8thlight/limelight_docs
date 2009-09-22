class_name :text => 'ClassName: Limelight::DSL::StylesBuilder'
class_description :text => 'The basis of the DSL for building Style objects.'
class_description :text => 'Sample StyleBuilder DSL'
codeblock do
code :text => '  sandbox {'
code :text => '    width "100%"'
code :text => '    height "100%"'
code :text => '    vertical_alignment :top'
code :text => '  }'
end
codeblock do
code :text => '  sample {'
code :text => '    width 320'
code :text => '    height 320'
code :text => '    gradient :on'
code :text => '  }'
end
codeblock do
code :text => '  spinner {'
code :text => '    extends :sample'
code :text => '    background_color :green'
code :text => '    secondary_background_color :blue'
code :text => '    gradient_angle 0'
code :text => '    gradient_penetration 100'
code :text => '  }'
end
class_description :text => 'This exmple builds three styles: sandbox, sample, spinner.  Within each style block, the individual attributes of the style may be set.'
class_description :text => 'See Limelight::Styles'
attributes_header :text => 'Attributes'
attributes do
attribute_header do
attributes_name :text => '__styles'
attributes_read_write :text => '[R]'
end
attribute_header do
attributes_name :text => '__extendable_styles'
attributes_read_write :text => '[R]'
end
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'new'
method_parameters :text => '(extendable_styles = nil)'
end
end
