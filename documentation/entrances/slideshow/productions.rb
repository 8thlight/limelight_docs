slide do
  heading :text => "Productions"
  directions :text => "A production is the root object in a Limelight application.  The production holds one or more scenes where the action happens."
end

slide do
  heading :text => "Production Directory Structure"
  directions :text => "There are two variations of the directory structure.  One is for single-scene productions, the other for multi-scene productions."
end


slide do
  heading :text => "Single Scene Production"
  directions :text => "This directory structure is convenient for simple Productions. Everything is optional."
  
  line_break
  
  screenshot :image => "images/single_scene_production.jpg", :players => "image"
  
  line_break
  
  directions :text => "Here's a brief description of each file:"
  line_break
  code :text => "+ init.rb - For configuring the Ruby environment and creating needed objects."
  code :text => "+ players - Directory containing Players for the Scene."
  code :text => "+ production.rb - For configures the Production."  
  code :text => "+ props.rb - Defines the Prop structure for the Scene."
  code :text => "+ stages.rb - Defines and configures the Stages in the Production."
  code :text => "+ styles.rb - Defines the Styles for the Scene."
end

slide do
  heading :text => "Multi-Scene Production"
  directions :text => "This directory structure allows Productions to host multiple Scenes."
  
  line_break
  
  screenshot :image => "images/multi_scene_production.jpg", :players => "image"
  
  line_break
  
  directions :text => "Typically a Production will not contain a props.rb file. For the most part, the various file represent the same thing as in a Single Scene Production."
  line_break
  directions :text => "The stages.rb is required to determine which Scene should be loaded on each Stage."
  line_break
  directions :text => "Notice that each Scene has it's own directory and should contains its own props.rb and styles.rb files, as well as its own players directory."
  line_break
  directions :text => "The root directory may also contain a styles.rb file that defines Styles shared by all the Scenes in the Production."
end
