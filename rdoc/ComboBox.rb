class_name :text => 'ClassName: Limelight::Builtin::Players::ComboBox'
class_description :text => 'A Builtin Player that adds the look and behavior of a native combo box.  It may be applied in the PropBuilder DSL
 like so:

   my_button :players => "combo_box"

 Props including this Player must not override the mouse_pressed event.

 Props including this Player may implement an additional hook:

   def value_changed(e)
      do something
   end

 Props including this Player may implement any of the key and focus event hooks:

   key_pressed, key_typed, key_released, focus_gained, focus_lost'
public_methods_header :text => 'Public Methods'
method_name :text => 'choices='
method_description :text => '# Sets the choices listed in the combo_box.  The value parameter should an Array or a String that
# can be evalulated into an Array.  All choices in a combo_box are strings.
#
# combo_box.choices = ["one", "two", "three"]
# combo_box.choices = "['one', 'two', 'three']"
#
'
method_name :text => 'value'
method_description :text => '# Returns the value of the currently selected choice.
#
'
method_name :text => 'value='
method_description :text => '# Sets the value of the combo box. The value provided should be one choices in the combo box.
#
'
