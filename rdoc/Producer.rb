class_name :text => 'ClassName: Limelight::Producer'
class_description :text => 'A Producer has the hefty responsibility of producing Productions.  Given a directory, it will load the neccessary files and create all the neccessary objects to bring a Production to life.'
line_break
class_description :text => 'For directory structures, see Limelight::Main'
line_break
public_methods_header :text => 'Public Methods'
method do
method_name :text => 'new'
method_parameters :text => '(root_path, theater=nil, production=nil)'
method_description :text => 'A Production name, or root directory, must be provided. If not Theater is provided, one will be created. You may also provide an existing Production for which this Producer will interact.'
line_break
end
method do
method_name :text => 'open'
method_parameters :text => '(production_name, options={})'
method_description :text => 'Creates a new Producer and has it open a Production by specified name.'
line_break
end
method do
method_name :text => 'casting_director'
method_parameters :text => '()'
method_description :text => 'Returns the CastingDirector for this Production.'
line_break
end
method do
method_name :text => 'load'
method_parameters :text => '(options = {})'
method_description :text => 'Loads the Production without opening it.  The Production will be created into memory with all it's stages'
line_break
end
method do
method_name :text => 'load_props'
method_parameters :text => '(options = {})'
method_description :text => 'Loads of the 'props.rb' file for a particular Scene and creates all the Prop objects and Scene.'
line_break
end
method do
method_name :text => 'load_stages'
method_parameters :text => '()'
method_description :text => 'Loads the 'stages.rb' file and configures all the Stages in the Production.'
line_break
end
method do
method_name :text => 'load_styles'
method_parameters :text => '(context)'
method_description :text => 'Loads the specified 'styles.rb' file and created a Hash of Styles.'
line_break
end
method do
method_name :text => 'open'
method_parameters :text => '(options = {})'
method_description :text => 'Opens the Production.'
line_break
end
method do
method_name :text => 'open_scene'
method_parameters :text => '(name, stage, options={})'
method_description :text => 'Opens the specified Scene onto the Spcified Stage.'
line_break
end
method do
method_name :text => 'unpack_production'
method_parameters :text => '(production_name)'
end
method do
method_name :text => 'version_compatible?'
method_parameters :text => '()'
method_description :text => 'Returns true if the production's minimum_limelight_version is compatible with the current version.'
line_break
end
