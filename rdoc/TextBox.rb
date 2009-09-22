class_name :text => 'ClassName: Limelight::Builtin::Players::TextBox'
class_description :text => 'A Builtin Player that adds the look and behavior of a native text box.  It may be applied in the PropBuilder DSL like so:'
line_break
codeblock do
code :text => '   my_text_box :players => "text_box"'
end
line_break
class_description :text => 'Props including this Player may implement any of the key and focus event hooks:'
line_break
codeblock do
code :text => '   key_pressed, key_typed, key_released, focus_gained, focus_lost'
end
line_break
public_methods_header :text => 'Public Methods'
