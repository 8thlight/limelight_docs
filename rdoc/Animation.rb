class_name :text => 'ClassName: Limelight::Animation'
class_description :text => 'An object to manage a seqeunce of changes, assuably to a prop.  The Animation object is constructed with options and a block.  Once the Animation is started, the block is invoked repeatedly until the Animation is stopped.'
line_break
class_desciption :text => 'Although, this object does not update the screen, it provides a means to perform sequential updates in evenly spaced time frames.'
public_methods_header :text => 'Public Methods'
method do
  method_name :text => 'new'
  method_parameters :text => '(prop, block, options={})'
  method_description :text => 'Prop and block are required to construct an Animation.  Options may include :name (string), :updates_per_second (int defaults to 60)'
  codeblock do
    code :text => "animation = Animation.new(prop, Proc.new { \"do something\"}, :updates_per_second => 20)"
    code :text => "animation.start"
    code :text => "animation.stop"
  end
end

method do
  method_name :text => 'running?'
  method_parameters :text => ''
  method_description :text => 'Lets you know if the animation is currently running or not.'
end