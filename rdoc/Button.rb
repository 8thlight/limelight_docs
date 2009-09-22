class_name :text => 'ClassName: Limelight::Builtin::Players::Button'
class_description :text => 'A Builtin Player that adds the look and behavior of a native button.  It may be applied in the PropBuilder DSL like so:'
codeblock do
code :text => '   my_button :players => "button"'
end
class_description :text => 'Props including this Player should implement the button_pressed hook.'
codeblock do
code :text => '   def button_pressed(e)'
code :text => '      do something'
code :text => '   end'
end
class_description :text => 'Props including this Player may implement any of the key and focus event hooks:'
codeblock do
code :text => '   key_pressed, key_typed, key_released, focus_gained, focus_lost'
end
attributes_header :text => 'Attributes'
attributes do
end
public_methods_header :text => 'Public Methods'
