class_name :text => 'ClassName: Limelight::Builtin::Players::Button'
class_description :text => 'A Builtin Player that adds the look and behavior of a native button.  It may be applied in the PropBuilder DSL
 like so:

   my_button :players => "button"

 Props including this Player should implement the button_pressed hook.

   def button_pressed(e)
      do something
   end

 Props including this Player may implement any of the key and focus event hooks:

   key_pressed, key_typed, key_released, focus_gained, focus_lost'
public_methods_header :text => 'Public Methods'
