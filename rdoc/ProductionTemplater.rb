class_name :text => 'ClassName: Limelight::Templates::ProductionTemplater'
class_description :text => 'A Templater that creates all the files and directories for a production.  When used with "love_story" as the production_path, the following will be the result.'
line_break
codeblock do
code :text => '    creating directory:  ./love_story'
code :text => '    creating file:       ./love_story/production.rb'
code :text => '    creating file:       ./love_story/stages.rb'
code :text => '    creating file:       ./love_story/styles.rb'
end
line_break
public_methods_header :text => 'Public Methods'
method do
method_name :text => 'new'
method_parameters :text => '(options)'
method_description :text => 'To create a ProductionTemplater, provide a production_path and the name of the default scene.'
line_break
end
method do
method_name :text => 'generate'
method_parameters :text => '()'
method_description :text => 'Generates the files'
line_break
end
