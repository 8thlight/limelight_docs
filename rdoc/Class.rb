class_name :text => 'ClassName: Class'
public_methods_header :text => 'Public Methods'
method do
method_name :text => 'getters'
method_parameters :text => '(*symbols)'
method_description :text => 'Class level method to creates Java style getters.'
line_break
codeblock do
code :text => '   getters :foo, :bar'
end
line_break
method_description :text => 'Creates the following methods:'
line_break
codeblock do
code :text => '   def getFoo'
code :text => '     return @foo'
code :text => '   end'
end
line_break
codeblock do
code :text => '   def getBar'
code :text => '     return @bar'
code :text => '   end'
end
line_break
end
method do
method_name :text => 'setters'
method_parameters :text => '(*symbols)'
method_description :text => 'Class level method to creates Java style setters.'
line_break
codeblock do
code :text => '   setters :foo, :bar'
end
line_break
method_description :text => 'Creates the following methods:'
line_break
codeblock do
code :text => '   def setFoo(value)'
code :text => '     @foo = value'
code :text => '   end'
end
line_break
codeblock do
code :text => '   def setBar(value)'
code :text => '     @bar = value'
code :text => '   end'
end
line_break
end
