class_name :text => 'ClassName: Class'
class_description :text => ''
public_methods_header :text => 'Public Methods'
method_name :text => 'getters'
method_description :text => '# Class level method to creates Java style getters.
#
#   getters :foo, :bar
#
# Creates the following methods:
#
#   def getFoo
#     return @foo
#   end
#
#   def getBar
#     return @bar
#   end
#
'
method_name :text => 'setters'
method_description :text => '# Class level method to creates Java style setters.
#
#   setters :foo, :bar
#
# Creates the following methods:
#
#   def setFoo(value)
#     @foo = value
#   end
#
#   def setBar(value)
#     @bar = value
#   end
#
'
