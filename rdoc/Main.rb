class_name :text => 'ClassName: Limelight::Main'
class_description :text => 'Used to open and manage Limelight Productions.'
class_description :text => 'Productions may have a single scene or multiple scenes.'
class_description :text => 'Single-Scene Production Directory Structure:'
codeblock do
code :text => '   - calculator'
code :text => '   | - props.rb'
code :text => '   | - styles.rb'
code :text => '   | - players'
code :text => '     | - <player_name>.rb'
code :text => '     | - *'
code :text => '   | - stages.rb'
code :text => '   | - production.rb'
end
class_description :text => 'In a Single-Scene production, the scene name and production name are the same.  As seen above, both names are \'calculator\'. Inside the scene there are three files and one directory, all of which are options.'
class_description :text => '== props.rb This file defines the props contained in the scene See Limelight::PropBuilder'
class_description :text => '== styles.rb This file defines the styles used in the scene See Limelight::StylesBuilder'
class_description :text => '== players A directory containing all the players used in the scene.  Players are modules that are included by Prop objects. If you have a Prop named \'wall\', then you may optionaly have a file named \'wall.rb\' in the players directory. Inside \'wall.rb\' you would define a module named \'Wall\'.  All behavior defined in the Wall modules will automatically be included in every prop named \'wall\'.'
class_description :text => '== stages.rb This file uses a DSL to configure the stages that will be used in the production. See Limelight::StagesBuilder'
class_description :text => '== production.rb This file uses a DSL to configure the current Production. See Limelight::ProductionBuilder'
class_description :text => 'Multiple-Scene Production Directory Structure:'
codeblock do
code :text => '   - sandbox'
code :text => '   | - stages.rb'
code :text => '   | - production.rb'
code :text => '   | - styles.rb'
code :text => '   | - players'
code :text => '     | - <player_name>.rb'
code :text => '   | - fader'
code :text => '     | - props.rb'
code :text => '     | - styles.rb'
code :text => '     | - players'
code :text => '       | - <player_name>.rb'
code :text => '   | - floater'
code :text => '     | - props.rb'
code :text => '     | - styles.rb'
code :text => '     | - players'
code :text => '       | - <player_name>.rb'
end
class_description :text => 'In a Multiple-Scene production, the production acquires that name of the root directory.  In this case the production is named \'sandbox\'. Each directory inside the root directory is a scene.  This production has two scenes named \'fader\' and \'floater\'.  Each scene is structured the same as in a Single-Scene production with the exception of the \'stages.rb\' file.  This file is specific to the production.  The production may contain a \'styles.rb\' which contains styles used by multiple scenes.  If some players are used in multiple Scenes, then it is useful to to create a players directory in the Production root to hold the common players. Other files may exist in the directory structure and they will not conflict with Limelight.'
class_description :text => 'See Limelight::Commands'
attributes_header :text => 'Attributes'
attributes do
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'run'
method_parameters :text => '(args)'
end
method_description :text => 'Instantiates a new instance of Main to process the command'
end
method do
method_header do
method_name :text => 'run'
method_parameters :text => '(args)'
end
method_description :text => 'Executes behavior of limelight command.'
end
method do
method_header do
method_name :text => 'usage'
method_parameters :text => '()'
end
method_description :text => 'Prints the usage of the limelight command.'
end
