class_name :text => 'ClassName: Limelight::Scene'
class_description :text => 'A Scene is a root Prop.  Scenes may be loaded onto a Stage.  In addition to being a Prop object, Scenes have a
 few extra attributes and behaviors.'
public_methods_header :text => 'Public Methods'
method_name :text => 'new'
method_description :text => ''
method_name :text => 'find'
method_description :text => '# Returns a Prop with the specified id.  Returns nil id the Prop doesn't exist in the Scene. 
#
'
method_name :text => 'index_prop'
method_description :text => '# Add the Prop to the index.  Provides fast lookup by id.
#
'
method_name :text => 'load'
method_description :text => '# Opens the specified Scene on the Stage currently occupied by this Scene.
# TODO It doesn't quite make sense that a scene loads other scene.  It has to replace itself?
#
'
method_name :text => 'menu_bar'
method_description :text => '# Creates the menu bar for the Scene 
#
'
method_name :text => 'open_chosen_production'
method_description :text => '# Opens a FileChooser for a new Production.  Loads the chosen Production.
#
'
method_name :text => 'open_production'
method_description :text => '# Creates a new Producer to open the specified Production.
#
'
method_name :text => 'path'
method_description :text => '# Returns the path to the root directory of the Scene
#
'
method_name :text => 'props_file'
method_description :text => '# Returns the path to the Scene's props file
#
'
method_name :text => 'reload'
method_description :text => ''
method_name :text => 'scene'
method_description :text => '# Returns self.  A Scene is it's own scene.
#
'
method_name :text => 'styles_file'
method_description :text => '# Returns the path to the Scene's props file
#
'
method_name :text => 'unindex_child_props'
method_description :text => ''
method_name :text => 'unindex_prop'
method_description :text => '# Removed the Prop from the index.
#
'
