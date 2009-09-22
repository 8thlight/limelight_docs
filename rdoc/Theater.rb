class_name :text => 'ClassName: Limelight::Theater'
class_description :text => 'A Theater represents a group of Stages.  Productions require a Theater in which to open.'
line_break
public_methods_header :text => 'Public Methods'
method do
method_name :text => 'new'
method_parameters :text => '()'
end
method do
method_name :text => '[]'
method_parameters :text => '(stage_name)'
method_description :text => 'Returns the Stage with the spcified name, nil if none exist with the specified name.'
line_break
end
method do
method_name :text => 'add_stage'
method_parameters :text => '(name, options = {})'
method_description :text => 'Adds a Stage to the Theater.  Raises an exception is the name of the Stage is duplicated.'
line_break
end
method do
method_name :text => 'build_stage'
method_parameters :text => '(name, options)'
end
method do
method_name :text => 'default_stage'
method_parameters :text => '()'
method_description :text => 'If no Stages are added, the Theater will provide a default Stage named "Limelight".'
line_break
end
method do
method_name :text => 'has_stages?'
method_parameters :text => '()'
method_description :text => 'Returns true if the theater has at least one stage'
line_break
end
method do
method_name :text => 'stage_activated'
method_parameters :text => '(stage)'
method_description :text => 'Lets the Theater know which stage has the limelight (currently active).'
line_break
end
method do
method_name :text => 'stage_closed'
method_parameters :text => '(stage)'
method_description :text => 'Removes the stage from this theater.'
line_break
end
method do
method_name :text => 'stages'
method_parameters :text => '()'
method_description :text => 'Returns an Array of Stages that belong to this Theater.'
line_break
end
