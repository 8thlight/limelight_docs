class_name :text => 'ClassName: Limelight::Builtin::Players::PasswordBox'
class_description :text => 'A Builtin Player that adds the look and behavior of a native password box.  It may be applied in the PropBuilder DSL like so:'
codeblock do
code :text => '   my_password_box :players => "password_box"'
end
class_description :text => 'Props including this Player may implement any of the key and focus event hooks:'
codeblock do
code :text => '   key_pressed, key_typed, key_released, focus_gained, focus_lost'
end
public_methods_header :text => 'Public Methods'
