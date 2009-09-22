class_name :text => 'ClassName: Limelight::Studio'
class_description :text => 'A Studio creates Productions.  There is only one instance of Studio per Limelight runtime.  All open productions are opened by the studio.'
line_break
public_methods_header :text => 'Public Methods'
method do
method_name :text => '[]'
method_parameters :text => '(name)'
method_description :text => 'Returns the production with the specified name that was previously opened but the Studio.'
line_break
end
method do
method_name :text => 'builtin_styles'
method_parameters :text => '()'
method_description :text => 'Returns a hash of all the built-in Limglight Styles'
line_break
end
method do
method_name :text => 'open'
method_parameters :text => '(production_path)'
method_description :text => 'Opens the production at the specified path.'
line_break
end
method do
method_name :text => 'production_closed'
method_parameters :text => '(production)'
method_description :text => 'Called when a production is closed to notify the studio of the event.'
line_break
end
method do
method_name :text => 'productions'
method_parameters :text => '()'
method_description :text => 'Returns an array of all the productions'
line_break
end
method do
method_name :text => 'publish_on_drb'
method_parameters :text => '(port)'
method_description :text => 'Publish the Studio, using DRb, on the specified port.'
line_break
end
method do
method_name :text => 'should_allow_shutdown'
method_parameters :text => '()'
method_description :text => 'Returns true if all of the open productions allow closing.'
line_break
end
method do
method_name :text => 'shutdown'
method_parameters :text => '()'
method_description :text => 'If allowed (should_allow_shutdown), this will close all open productions and shutdown the limelight runtime.'
line_break
end
method do
method_name :text => 'utilities_production'
method_parameters :text => '()'
method_description :text => 'Returns the utilities production; a production used by limelight.'
line_break
end
method do
method_name :text => 'open'
method_parameters :text => '(production_path)'
method_description :text => 'Same as the class level method.'
line_break
end
method do
method_name :text => 'should_allow_shutdown'
method_parameters :text => '()'
method_description :text => 'Same as the class level method.'
line_break
end
method do
method_name :text => 'shutdown'
method_parameters :text => '()'
method_description :text => 'Same as the class level method.'
line_break
end
