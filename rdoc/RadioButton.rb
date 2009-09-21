class_name :text => 'ClassName: Limelight::Builtin::Players::RadioButton'
class_description :text => 'A Builtin Player that adds the look and behavior of a native radio button.  It may be applied in the PropBuilder DSL
 like so:

   my_radio_button :players => "radio_button", :id => "radio1", :group => "my_radio_button_group"

 When including this Player, it's important to specify a group and id.  All radio buttons in the same group will
 be mutually exclusive.  The value of a radio button group will be the id of the selected radio button.

 Props including this Player may implement the button_pressed hook.

   def button_pressed(e)
      do something
   end

 Props including this Player may implement any of the key and focus event hooks:

   key_pressed, key_typed, key_released, focus_gained, focus_lost'
public_methods_header :text => 'Public Methods'
method_name :text => 'checked'
method_description :text => '# Returns true is this radio is button is checked.
#
'
method_name :text => 'checked='
method_description :text => '# Checks or unchecks this radio button.
#
'
method_name :text => 'checked?'
method_description :text => 'Alias for #checked'
method_name :text => 'group='
method_description :text => '# Sets the radio button group to which this radio button belongs.
#
'
method_name :text => 'selected'
method_description :text => 'Alias for #checked'
method_name :text => 'selected='
method_description :text => 'Alias for #checked='
method_name :text => 'selected?'
method_description :text => 'Alias for #checked'
