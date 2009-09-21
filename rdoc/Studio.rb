class_name :text => 'ClassName: Limelight::Studio'
class_description :text => 'A Studio creates Productions.  There is only one instance of Studio per Limelight runtime.  All open productions
 are opened by the studio.'
public_methods_header :text => 'Public Methods'
method_name :text => '[]'
method_description :text => '# Returns the production with the specified name that was previously opened but the Studio.
#
'
method_name :text => 'builtin_styles'
method_description :text => '# Returns a hash of all the built-in Limglight Styles
#
'
method_name :text => 'open'
method_description :text => '# Opens the production at the specified path.
#
'
method_name :text => 'production_closed'
method_description :text => '# Called when a production is closed to notify the studio of the event.
#
'
method_name :text => 'productions'
method_description :text => '# Returns an array of all the productions
#
'
method_name :text => 'publish_on_drb'
method_description :text => '# Publish the Studio, using DRb, on the specified port.
#
'
method_name :text => 'should_allow_shutdown'
method_description :text => '# Returns true if all of the open productions allow closing.
#
'
method_name :text => 'shutdown'
method_description :text => '# If allowed (should_allow_shutdown), this will close all open productions and shutdown the limelight runtime.
#
'
method_name :text => 'utilities_production'
method_description :text => '# Returns the utilities production; a production used by limelight.
#
'
method_name :text => 'open'
method_description :text => '# Same as the class level method.
#
'
method_name :text => 'should_allow_shutdown'
method_description :text => '# Same as the class level method.
#
'
method_name :text => 'shutdown'
method_description :text => '# Same as the class level method.
#
'
