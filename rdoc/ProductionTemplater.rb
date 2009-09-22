class_name :text => 'ClassName: Limelight::Templates::ProductionTemplater'
class_description :text => 'A Templater that creates all the files and directories for a production.  When used with "love_story" as the production_path, the following will be the result.'
codeblock do
code :text => '    creating directory:  ./love_story'
code :text => '    creating file:       ./love_story/production.rb'
code :text => '    creating file:       ./love_story/stages.rb'
code :text => '    creating file:       ./love_story/styles.rb'
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
method_description :text => 'To create a ProductionTemplater, provide a production_path and the name of the default scene.'
end
method do
method_header do
method_name :text => 'generate'
method_parameters :text => '()'
end
method_description :text => 'Generates the files'
end
