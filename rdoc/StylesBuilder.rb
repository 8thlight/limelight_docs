class_name :text => 'ClassName: Limelight::DSL::StylesBuilder'
class_description :text => 'The basis of the DSL for building Style objects.'
line_break
class_description :text => 'Sample StyleBuilder DSL'
line_break
codeblock do
code :text => '  sandbox {'
code :text => '    width "100%"'
code :text => '    height "100%"'
code :text => '    vertical_alignment :top'
code :text => '  }'
end
line_break
codeblock do
code :text => '  sample {'
code :text => '    width 320'
code :text => '    height 320'
code :text => '    gradient :on'
code :text => '  }'
end
line_break
codeblock do
code :text => '  spinner {'
code :text => '    extends :sample'
code :text => '    background_color :green'
code :text => '    secondary_background_color :blue'
code :text => '    gradient_angle 0'
code :text => '    gradient_penetration 100'
code :text => '  }'
end
line_break
class_description :text => 'This exmple builds three styles: sandbox, sample, spinner.  Within each style block, the individual attributes of the style may be set.'
line_break
class_description :text => 'See Limelight::Styles'
line_break
public_methods_header :text => 'Public Methods'
method do
method_name :text => 'new'
method_parameters :text => '(extendable_styles = nil)'
end
