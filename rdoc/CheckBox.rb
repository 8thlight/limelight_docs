class_name :text => 'ClassName: Limelight::Builtin::Players::CheckBox'
class_description :text => 'A Builtin Player that adds the look and behavior of a native check box.  It may be applied in the PropBuilder DSL
 like so:

   my_check_box :players => "check_box"

 Props including this Player may implement the button_pressed hook.

   def button_pressed(e)
      do something
   end

 Props including this Player may implement any of the key and focus event hooks:

   key_pressed, key_typed, key_released, focus_gained, focus_lost'
public_methods_header :text => 'Public Methods'
method_name :text => 'checked'
method_description :text => '# Returns true if the check box is checked.
#
'
method_name :text => 'checked='
method_description :text => '# Will place or remove a check mark in the check box.
#
'
method_name :text => 'checked?'
method_description :text => 'Alias for #checked'
