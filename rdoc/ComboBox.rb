class_name :text => 'ClassName: Limelight::Builtin::Players::ComboBox'
class_description :text => 'A Builtin Player that adds the look and behavior of a native combo box.  It may be applied in the PropBuilder DSL like so:'
line_break
codeblock do
code :text => '   my_button :players => "combo_box"'
end
line_break
class_description :text => 'Props including this Player must not override the mouse_pressed event.'
line_break
class_description :text => 'Props including this Player may implement an additional hook:'
line_break
codeblock do
code :text => '   def value_changed(e)'
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
method_name :text => 'choices='
method_parameters :text => '(value)'
method_description :text => 'Sets the choices listed in the combo_box.  The value parameter should an Array or a String that can be evalulated into an Array.  All choices in a combo_box are strings.'
line_break
method_description :text => 'combo_box.choices = ["one", "two", "three"] combo_box.choices = "['one', 'two', 'three']"'
line_break
end
method do
method_name :text => 'value'
method_parameters :text => '()'
method_description :text => 'Returns the value of the currently selected choice.'
line_break
end
method do
method_name :text => 'value='
method_parameters :text => '(text)'
method_description :text => 'Sets the value of the combo box. The value provided should be one choices in the combo box.'
line_break
end
