class_name :text => 'ClassName: Class'
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'getters'
method_parameters :text => '(*symbols)'
end
method_description :text => 'Class level method to creates Java style getters.'
codeblock do
code :text => '   getters :foo, :bar'
end
method_description :text => 'Creates the following methods:'
codeblock do
code :text => '   def getFoo'
code :text => '     return @foo'
code :text => '   end'
end
codeblock do
code :text => '   def getBar'
code :text => '     return @bar'
code :text => '   end'
end
end
method do
method_header do
method_name :text => 'setters'
method_parameters :text => '(*symbols)'
end
method_description :text => 'Class level method to creates Java style setters.'
codeblock do
code :text => '   setters :foo, :bar'
end
method_description :text => 'Creates the following methods:'
codeblock do
code :text => '   def setFoo(value)'
code :text => '     @foo = value'
code :text => '   end'
end
codeblock do
code :text => '   def setBar(value)'
code :text => '     @bar = value'
code :text => '   end'
end
end
