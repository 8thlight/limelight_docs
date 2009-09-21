class_name :text => 'ClassName: Limelight::Theater'
class_description :text => 'A Theater represents a group of Stages.  Productions require a Theater in which to open.'
public_methods_header :text => 'Public Methods'
method_name :text => 'new'
method_description :text => ''
method_name :text => '[]'
method_description :text => '# Returns the Stage with the spcified name, nil if none exist with the specified name.
#
'
method_name :text => 'add_stage'
method_description :text => '# Adds a Stage to the Theater.  Raises an exception is the name of the Stage is duplicated.
#
'
method_name :text => 'build_stage'
method_description :text => ''
method_name :text => 'default_stage'
method_description :text => '# If no Stages are added, the Theater will provide a default Stage named "Limelight".
#
'
method_name :text => 'has_stages?'
method_description :text => '# Returns true if the theater has at least one stage
#
'
method_name :text => 'stage_activated'
method_description :text => '# Lets the Theater know which stage has the limelight (currently active).
#
'
method_name :text => 'stage_closed'
method_description :text => '# Removes the stage from this theater.
#
'
method_name :text => 'stages'
method_description :text => '# Returns an Array of Stages that belong to this Theater.
#
'
