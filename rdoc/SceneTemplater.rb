class_name :text => 'ClassName: Limelight::Templates::SceneTemplater'
class_description :text => 'A derivative of Templater that generates all the files for a scene. When created with the path "midnight_romance" the following will result:'
codeblock do
code :text => '    creating directory:  ./midnight_romance'
code :text => '    creating file:       ./midnight_romance/props.rb'
code :text => '    creating file:       ./midnight_romance/styles.rb'
code :text => '    creating directory:  ./midnight_romance/players'
end
attributes_header :text => 'Attributes'
attributes do
attribute_header do
attributes_name :text => 'tokens'
attributes_read_write :text => '[R]'
end
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'new'
method_parameters :text => '(options)'
end
method_description :text => 'The scene_path should be path to a desired scene inside a production directory.'
end
method do
method_header do
method_name :text => 'generate'
method_parameters :text => '()'
end
method_description :text => 'Generates the files'
end
