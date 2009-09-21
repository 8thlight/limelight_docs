class_name :text => 'ClassName: Limelight::Main'
class_description :text => 'Used to open and manage Limelight Productions.

 Productions may have a single scene or multiple scenes.

 Single-Scene Production Directory Structure:

   - calculator
   | - props.rb
   | - styles.rb
   | - players
     | - <player_name>.rb
     | - *
   | - stages.rb
   | - production.rb

 In a Single-Scene production, the scene name and production name are the same.  As seen above, both names are 'calculator'.
 Inside the scene there are three files and one directory, all of which are options.

 == props.rb
 This file defines the props contained in the scene
 See Limelight::PropBuilder

 == styles.rb
 This file defines the styles used in the scene
 See Limelight::StylesBuilder

 == players
 A directory containing all the players used in the scene.  Players are modules that are included by Prop objects.
 If you have a Prop named 'wall', then you may optionaly have a file named 'wall.rb' in the players directory.
 Inside 'wall.rb' you would define a module named 'Wall'.  All behavior defined in the Wall modules will automatically be included
 in every prop named 'wall'.

 == stages.rb
 This file uses a DSL to configure the stages that will be used in the production.
 See Limelight::StagesBuilder

 == production.rb
 This file uses a DSL to configure the current Production.
 See Limelight::ProductionBuilder

 Multiple-Scene Production Directory Structure:

   - sandbox
   | - stages.rb
   | - production.rb
   | - styles.rb
   | - players
     | - <player_name>.rb
   | - fader
     | - props.rb
     | - styles.rb
     | - players
       | - <player_name>.rb
   | - floater
     | - props.rb
     | - styles.rb
     | - players
       | - <player_name>.rb

 In a Multiple-Scene production, the production acquires that name of the root directory.  In this case the production is named 'sandbox'.
 Each directory inside the root directory is a scene.  This production has two scenes named 'fader' and 'floater'.  Each scene is structured
 the same as in a Single-Scene production with the exception of the 'stages.rb' file.  This file is specific to the production.  The production
 may contain a 'styles.rb' which contains styles used by multiple scenes.  If some players are used in multiple Scenes, then it is useful to
 to create a players directory in the Production root to hold the common players. Other files may exist in the directory structure and they will not
 conflict with Limelight.

 See Limelight::Commands'
public_methods_header :text => 'Public Methods'
method_name :text => 'run'
method_description :text => '# Instantiates a new instance of Main to process the command
#
'
method_name :text => 'run'
method_description :text => '# Executes behavior of limelight command.
#
'
method_name :text => 'usage'
method_description :text => '# Prints the usage of the limelight command.
#
'
