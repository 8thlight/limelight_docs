class_name :text => 'ClassName: Limelight::Theater'
class_description :text => 'A Theater represents a group of Stages.  Productions require a Theater in which to open.'
attributes_header :text => 'Attributes'
attributes do
attribute_header do
attributes_name :text => 'active_stage'
attributes_read_write :text => '[R]'
attribute_description :text => 'Returns the theater\'s active stage.  i.e. the stage most recently used.'
end
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'new'
method_parameters :text => '()'
end
end
method do
method_header do
method_name :text => '[]'
method_parameters :text => '(stage_name)'
end
method_description :text => 'Returns the Stage with the spcified name, nil if none exist with the specified name.'
end
method do
method_header do
method_name :text => 'add_stage'
method_parameters :text => '(name, options = {})'
end
method_description :text => 'Adds a Stage to the Theater.  Raises an exception is the name of the Stage is duplicated.'
end
method do
method_header do
method_name :text => 'build_stage'
method_parameters :text => '(name, options)'
end
end
method do
method_header do
method_name :text => 'default_stage'
method_parameters :text => '()'
end
method_description :text => 'If no Stages are added, the Theater will provide a default Stage named "Limelight".'
end
method do
method_header do
method_name :text => 'has_stages?'
method_parameters :text => '()'
end
method_description :text => 'Returns true if the theater has at least one stage'
end
method do
method_header do
method_name :text => 'stage_activated'
method_parameters :text => '(stage)'
end
method_description :text => 'Lets the Theater know which stage has the limelight (currently active).'
end
method do
method_header do
method_name :text => 'stage_closed'
method_parameters :text => '(stage)'
end
method_description :text => 'Removes the stage from this theater.'
end
method do
method_header do
method_name :text => 'stages'
method_parameters :text => '()'
end
method_description :text => 'Returns an Array of Stages that belong to this Theater.'
end
