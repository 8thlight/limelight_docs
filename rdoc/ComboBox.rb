class_name :text => 'ClassName: Limelight::Builtin::Players::ComboBox'
class_description :text => 'A Builtin Player that adds the look and behavior of a native combo box.  It may be applied in the PropBuilder DSL like so:'
codeblock do
code :text => '   my_button :players => "combo_box"'
end
class_description :text => 'Props including this Player must not override the mouse_pressed event.'
class_description :text => 'Props including this Player may implement an additional hook:'
codeblock do
code :text => '   def value_changed(e)'
code :text => '      do something'
code :text => '   end'
end
class_description :text => 'Props including this Player may implement any of the key and focus event hooks:'
codeblock do
code :text => '   key_pressed, key_typed, key_released, focus_gained, focus_lost'
end
attributes_header :text => 'Attributes'
attributes do
attribute_header do
attributes_name :text => 'choices'
attributes_read_write :text => '[R]'
end
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'choices='
method_parameters :text => '(value)'
end
method_description :text => 'Sets the choices listed in the combo_box.  The value parameter should an Array or a String that can be evalulated into an Array.  All choices in a combo_box are strings.'
method_description :text => 'combo_box.choices = ["one", "two", "three"] combo_box.choices = "[\'one\', \'two\', \'three\']"'
end
method do
method_header do
method_name :text => 'value'
method_parameters :text => '()'
end
method_description :text => 'Returns the value of the currently selected choice.'
end
method do
method_header do
method_name :text => 'value='
method_parameters :text => '(text)'
end
method_description :text => 'Sets the value of the combo box. The value provided should be one choices in the combo box.'
end
