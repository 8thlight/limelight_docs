class_name :text => 'ClassName: Limelight::Scene'
class_description :text => 'A Scene is a root Prop.  Scenes may be loaded onto a Stage.  In addition to being a Prop object, Scenes have a few extra attributes and behaviors.'
attributes_header :text => 'Attributes'
attributes do
attribute_header do
attributes_name :text => 'button_groups'
attributes_read_write :text => '[R]'
end
attribute_header do
attributes_name :text => 'casting_director'
attributes_read_write :text => '[R]'
end
attribute_header do
attributes_name :text => 'cast'
attributes_read_write :text => '[R]'
end
attribute_header do
attributes_name :text => 'stage'
attributes_read_write :text => '[RW]'
end
attribute_header do
attributes_name :text => 'visible'
attributes_read_write :text => '[RW]'
end
attribute_header do
attributes_name :text => 'production'
attributes_read_write :text => '[RW]'
end
attribute_header do
attributes_name :text => 'styles'
attributes_read_write :text => '[RW]'
end
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'new'
method_parameters :text => '(options={})'
end
end
method do
method_header do
method_name :text => 'find'
method_parameters :text => '(id)'
end
method_description :text => 'Returns a Prop with the specified id.  Returns nil id the Prop doesn\'t exist in the Scene.'
end
method do
method_header do
method_name :text => 'index_prop'
method_parameters :text => '(prop)'
end
method_description :text => 'Add the Prop to the index.  Provides fast lookup by id.'
end
method do
method_header do
method_name :text => 'load'
method_parameters :text => '(scene_name)'
end
method_description :text => 'Opens the specified Scene on the Stage currently occupied by this Scene. TODO It doesn\'t quite make sense that a scene loads other scene.  It has to replace itself?'
end
method do
method_header do
method_name :text => 'menu_bar'
method_parameters :text => '()'
end
method_description :text => 'Creates the menu bar for the Scene'
end
method do
method_header do
method_name :text => 'open_chosen_production'
method_parameters :text => '()'
end
method_description :text => 'Opens a FileChooser for a new Production.  Loads the chosen Production.'
end
method do
method_header do
method_name :text => 'open_production'
method_parameters :text => '(production_path)'
end
method_description :text => 'Creates a new Producer to open the specified Production.'
end
method do
method_header do
method_name :text => 'path'
method_parameters :text => '()'
end
method_description :text => 'Returns the path to the root directory of the Scene'
end
method do
method_header do
method_name :text => 'props_file'
method_parameters :text => '()'
end
method_description :text => 'Returns the path to the Scene\'s props file'
end
method do
method_header do
method_name :text => 'reload'
method_parameters :text => '()'
end
end
method do
method_header do
method_name :text => 'scene'
method_parameters :text => '()'
end
method_description :text => 'Returns self.  A Scene is it\'s own scene.'
end
method do
method_header do
method_name :text => 'styles_file'
method_parameters :text => '()'
end
method_description :text => 'Returns the path to the Scene\'s props file'
end
method do
method_header do
method_name :text => 'unindex_child_props'
method_parameters :text => '(prop)'
end
end
method do
method_header do
method_name :text => 'unindex_prop'
method_parameters :text => '(prop)'
end
method_description :text => 'Removed the Prop from the index.'
end
