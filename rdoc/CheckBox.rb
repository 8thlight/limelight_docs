class_name :text => 'ClassName: Limelight::Builtin::Players::CheckBox'
class_description :text => 'A Builtin Player that adds the look and behavior of a native check box.  It may be applied in the PropBuilder DSL like so:'
codeblock do
code :text => '   my_check_box :players => "check_box"'
end
class_description :text => 'Props including this Player may implement the button_pressed hook.'
codeblock do
code :text => '   def button_pressed(e)'
code :text => '      do something'
code :text => '   end'
end
class_description :text => 'Props including this Player may implement any of the key and focus event hooks:'
codeblock do
code :text => '   key_pressed, key_typed, key_released, focus_gained, focus_lost'
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'checked'
method_parameters :text => '()'
end
method_description :text => 'Returns true if the check box is checked.'
end
method do
method_header do
method_name :text => 'checked='
method_parameters :text => '(value)'
end
method_description :text => 'Will place or remove a check mark in the check box.'
end
method do
method_header do
method_name :text => 'checked?'
method_parameters :text => '()'
end
method_description :text => 'Alias for checked'
end
