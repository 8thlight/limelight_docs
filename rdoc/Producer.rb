class_name :text => 'ClassName: Limelight::Producer'
class_description :text => 'A Producer has the hefty responsibility of producing Productions.  Given a directory, it will load the neccessary files and create all the neccessary objects to bring a Production to life.'
class_description :text => 'For directory structures, see Limelight::Main'
attributes_header :text => 'Attributes'
attributes do
attribute_header do
attributes_name :text => 'theater'
attributes_read_write :text => '[R]'
end
attribute_header do
attributes_name :text => 'production'
attributes_read_write :text => '[R]'
end
attribute_header do
attributes_name :text => 'builtin_styles'
attributes_read_write :text => '[W]'
end
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'new'
method_parameters :text => '(root_path, theater=nil, production=nil)'
end
method_description :text => 'A Production name, or root directory, must be provided. If not Theater is provided, one will be created. You may also provide an existing Production for which this Producer will interact.'
end
method do
method_header do
method_name :text => 'open'
method_parameters :text => '(production_name, options={})'
end
method_description :text => 'Creates a new Producer and has it open a Production by specified name.'
end
method do
method_header do
method_name :text => 'casting_director'
method_parameters :text => '()'
end
method_description :text => 'Returns the CastingDirector for this Production.'
end
method do
method_header do
method_name :text => 'load'
method_parameters :text => '(options = {})'
end
method_description :text => 'Loads the Production without opening it.  The Production will be created into memory with all it\'s stages'
end
method do
method_header do
method_name :text => 'load_props'
method_parameters :text => '(options = {})'
end
method_description :text => 'Loads of the \'props.rb\' file for a particular Scene and creates all the Prop objects and Scene.'
end
method do
method_header do
method_name :text => 'load_stages'
method_parameters :text => '()'
end
method_description :text => 'Loads the \'stages.rb\' file and configures all the Stages in the Production.'
end
method do
method_header do
method_name :text => 'load_styles'
method_parameters :text => '(context)'
end
method_description :text => 'Loads the specified \'styles.rb\' file and created a Hash of Styles.'
end
method do
method_header do
method_name :text => 'open'
method_parameters :text => '(options = {})'
end
method_description :text => 'Opens the Production.'
end
method do
method_header do
method_name :text => 'open_scene'
method_parameters :text => '(name, stage, options={})'
end
method_description :text => 'Opens the specified Scene onto the Spcified Stage.'
end
method do
method_header do
method_name :text => 'unpack_production'
method_parameters :text => '(production_name)'
end
end
method do
method_header do
method_name :text => 'version_compatible?'
method_parameters :text => '()'
end
method_description :text => 'Returns true if the production\'s minimum_limelight_version is compatible with the current version.'
end
