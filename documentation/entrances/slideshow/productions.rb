slide do
  heading :text => "Productions"
  directions :text => "A Production is the root object in a Limelight application.  The production holds one or more scenes where the action happens."
end

slide do
  heading :text => "1. Production Directory Structure"
  directions :text => "There are two variations of the directory structure.  One is for single-scene productions, the other for multi-scene productions."
end


slide do
  heading :text => "2. Single Scene Production"
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
  heading :text => "3. Multi-Scene Production"
  directions :text => "This directory structure allows Productions to host multiple Scenes."
  
  line_break
  
  screenshot :image => "images/multi_scene_production.jpg", :players => "image"
  
  line_break
  
  directions :text => "Typically a Production will not contain a props.rb file. For the most part, the various file represent the same thing as in a Single Scene Production."
  line_break
  directions :text => "The stages.rb is required to determine which Scene should be loaded on each Stage."
  line_break
  directions :text => "Notice that each Scene has it's own directory and should contain its own props.rb and styles.rb files, as well as its own players directory."
  line_break
  directions :text => "The root directory may also contain a styles.rb file that defines Styles shared by all the Scenes in the Production."
end

slide do
  heading :text => "4. Configuring the Production"
  directions :text => "Each production can be configured in the production.rb file.  It has two functions:"
  line_break
  directions :text => "1. Give the Production a name which is used to identify a Production; this could be important as there can be multiple productions open at once."
  directions :text => "2. Add attributes to the Production.  The Production is accessible by all Props and Players, so this is a convenient place to keep resources."
end

slide do
  heading :text => "5. Setting the Name of a Production"
  directions :text => "To set the name of a Production, override the name method in production.rb"
  line_break
  code :text => "module Production"
  code :text => "  def name"
  code :text => "    return \"My Production Name\""
  code :text => "  end"
  code :text => "end"
end

slide do
  heading :text => "6. Hooks"
  directions :text => "There are a number of hooks defined.  These methods can be defined in production.rb in order to initialize your Production."
end

slide do
  heading :text => "7. Hook #1: production_opening"
  
  directions :text => "This method is called when the Production is newly created.  This is a good place to require needed files, append search paths to $:, and instantiate key business logic objects."
  
  line_break
  code :text => "module Production"
  code :text => "  def production_opening"
  code :text => "    $:<< File.expand_path(File.dirname(__FILE__) + \"/lib\")"
  code :text => "  end"
  code :text => "end"
end

slide do
  heading :text => "8. Hook #2: production_loaded"
  
  directions :text => "This method is called after internal gems have been loaded and stages have been instantiated, yet before any scenes have been opened."
  
  line_break
  code :text => "module Production"
  code :text => "  def production_loaded"
  code :text => "  end"
  code :text => "end"
end

slide do
  heading :text => "9. Hook #3: production_opened"
  
  directions :text => "This method is called when the production, and all the scenes, have fully opened."
  
  line_break
  code :text => "module Production"
  code :text => "  def production_opened"
  code :text => "  end"
  code :text => "end"
end

slide do
  heading :text => "10. Hook #4: production_closing"
  
  directions :text => "This method is called when the production is about to be closed."
  
  line_break
  code :text => "module Production"
  code :text => "  def production_closing"
  code :text => "  end"
  code :text => "end"
end

slide do
  heading :text => "11. Hook #5: production_closed"
  
  directions :text => "This method is called when the production is fully closed."
  
  line_break
  code :text => "module Production"
  code :text => "  def production_closed"
  code :text => "  end"
  code :text => "end"
end

slide do
  heading :text => "12. Finished"
  directions :text => "Great!  Now you know all about Productions.  When you're ready, head to the next tutorial."
end
