class_name :text => 'ClassName: Limelight::Templates::ProductionTemplater'
class_description :text => 'A Templater that creates all the files and directories for a production.  When used with "love_story" as
 the production_path, the following will be the result.

    creating directory:  ./love_story
    creating file:       ./love_story/production.rb
    creating file:       ./love_story/stages.rb
    creating file:       ./love_story/styles.rb'
public_methods_header :text => 'Public Methods'
method_name :text => 'new'
method_description :text => '# To create a ProductionTemplater, provide a production_path and the name of the default scene.
#
'
method_name :text => 'generate'
method_description :text => '# Generates the files
#
'
