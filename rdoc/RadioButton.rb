class_name :text => 'ClassName: Limelight::Builtin::Players::RadioButton'
class_description :text => 'A Builtin Player that adds the look and behavior of a native radio button.  It may be applied in the PropBuilder DSL like so:'
line_break
codeblock do
code :text => '   my_radio_button :players => "radio_button", :id => "radio1", :group => "my_radio_button_group"'
end
line_break
class_description :text => 'When including this Player, it's important to specify a group and id.  All radio buttons in the same group will be mutually exclusive.  The value of a radio button group will be the id of the selected radio button.'
line_break
class_description :text => 'Props including this Player may implement the button_pressed hook.'
line_break
codeblock do
code :text => '   def button_pressed(e)'
code :text => '      do something'
code :text => '   end'
end
line_break
class_description :text => 'Props including this Player may implement any of the key and focus event hooks:'
line_break
codeblock do
code :text => '   key_pressed, key_typed, key_released, focus_gained, focus_lost'
end
line_break
public_methods_header :text => 'Public Methods'
method do
method_name :text => 'checked'
method_parameters :text => '()'
method_description :text => 'Returns true is this radio is button is checked.'
line_break
end
method do
method_name :text => 'checked='
method_parameters :text => '(value)'
method_description :text => 'Checks or unchecks this radio button.'
line_break
end
method do
method_name :text => 'checked?'
method_parameters :text => '()'
method_description :text => 'Alias for checked'
end
method do
method_name :text => 'group='
method_parameters :text => '(group_name)'
method_description :text => 'Sets the radio button group to which this radio button belongs.'
line_break
end
method do
method_name :text => 'selected'
method_parameters :text => '()'
method_description :text => 'Alias for checked'
end
method do
method_name :text => 'selected='
method_parameters :text => '(value)'
method_description :text => 'Alias for checked='
end
method do
method_name :text => 'selected?'
method_parameters :text => '()'
method_description :text => 'Alias for checked'
end
