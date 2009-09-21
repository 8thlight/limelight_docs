class_name :text => 'ClassName: Limelight::Producer'
class_description :text => 'A Producer has the hefty responsibility of producing Productions.  Given a directory, it will load the neccessary
 files and create all the neccessary objects to bring a Production to life.

 For directory structures, see Limelight::Main'
public_methods_header :text => 'Public Methods'
method_name :text => 'new'
method_description :text => '# A Production name, or root directory, must be provided. If not Theater is provided, one will be created.
# You may also provide an existing Production for which this Producer will interact.
#
'
method_name :text => 'open'
method_description :text => '# Creates a new Producer and has it open a Production by specified name.
#
'
method_name :text => 'casting_director'
method_description :text => '# Returns the CastingDirector for this Production.
#
'
method_name :text => 'load'
method_description :text => '# Loads the Production without opening it.  The Production will be created into memory with all it's stages
#
'
method_name :text => 'load_props'
method_description :text => '# Loads of the 'props.rb' file for a particular Scene and creates all the Prop objects and Scene.
#
'
method_name :text => 'load_stages'
method_description :text => '# Loads the 'stages.rb' file and configures all the Stages in the Production.
#
'
method_name :text => 'load_styles'
method_description :text => '# Loads the specified 'styles.rb' file and created a Hash of Styles.
#
'
method_name :text => 'open'
method_description :text => '# Opens the Production.
#
'
method_name :text => 'open_scene'
method_description :text => '# Opens the specified Scene onto the Spcified Stage.
#
'
method_name :text => 'unpack_production'
method_description :text => ''
method_name :text => 'version_compatible?'
method_description :text => '# Returns true if the production's minimum_limelight_version is compatible with the current version.
#
'
