slide do
  heading :text => "Productions"
  directions :text => "\"Production\" is the term used for applications that run in Limelight.  A Production is a container for Scenes and behavior."
end

slide do
  heading :text => "Production Directory Structure"
  directions :text => "The directory structure allows Productions to host multiple Scenes.  Notice that each Scene has it's own directory and should contain its own props.rb and styles.rb files, as well as its own players directory."
  line_break
  directions :text => "The root directory may also contain a styles.rb file that defines Styles shared by all the Scenes in the Production."
  line_break
  screenshot :image => "images/production_directory.jpg", :players => "image"
  
  line_break
  
  directions :text => "Here's a brief description of each file / folder:"
  line_break
  code :text => "+ default_scene - Each scene is in its own folder."
  code :text => "  + players - Contains Players (controllers) for the Scene."
  code :text => "  + props.rb - Specifies the Prop structure for the Scene."
  code :text => "  + styles.rb - Specifies the Styles for the Scene."
  code :text => "+ spec - Your tests go here."
  code :text => "+ production.rb - For configuring the Production."  
  code :text => "+ stages.rb - Defines and configures the Stages in the Production."
  code :text => "+ styles.rb - Production Styles go here, to be shared across all scenes."
end

slide do
  heading :text => "Configuring the Production"
  directions :text => "Each production can be configured in the production.rb file located in the root directory of your production."
  line_break
  directions :text => "Here, you can set the name of the production, implement hooks called by the framework and add attributes to a Production."
end

slide do
  heading :text => "Setting the Name of a Production"
  directions :text => "To set the name of a Production, override the name method in your production.rb file.  If the name method is not overridden, the name will default to the titleized name of the production directory."
  line_break
  code :text => "module Production"
  code :text => "  def name"
  code :text => "    return \"My Production Name\""
  code :text => "  end"
  code :text => "end"
end

slide do
  heading :text => "Attributes"
  
  directions :text => "Key business logic objects can be instantiated from any of the hooks in production.rb.  To access these objects from anywhere within your Production, you must first specify an accessor."
  line_break
  code :text => "module Production"
  bold_code :text => "  attr_accessor :business_object"
  code :text => "  def production_opened"
  code :text => "    @business_object = BusinessObject.new"
  code :text => "  end"
  code :text => "end"
  line_break
  directions :text => "Then, to access this business object from elsewhere in you Production, you can do this:"
  line_break
  code :text => "production.business_object"
end

slide do
  heading :text => "allow_close?"
  
  # Returns true if the production allows itself to be closed.  The system will call this methods when
  # it wishes to close the production, perhaps when the user quits the application.  By default the production
  # will always return true.
  
  directions :text => "When the system wishes to close the production, this method is called to see if the production will allow itself to be closed."
  line_break
  directions :text => "This returns true by defuault.  If false is returned, Limelight will prevent the production from being closed."
  
  line_break
  code :text => "module Production"
  code :text => "  def allow_close?"
  code :text => "    return false"
  code :text => "  end"
  code :text => "end"
end

slide do
  heading :text => "Hooks"
  directions :text => "There are a number of hooks that the Limelight framework will call at certain times in the production life cycle.  These methods can be defined in production.rb."
end

slide do
  heading :text => "Hook #1: production_opening"
  
  directions :text => "This method is called when the Production is newly created.  This is a good place to require needed files, append search paths to $:, and instantiate key business logic objects."
  
  line_break
  code :text => "module Production"
  code :text => "  def production_opening"
  code :text => "    $:<< File.expand_path(File.dirname(__FILE__) + \"/lib\")"
  code :text => "  end"
  code :text => "end"
end

slide do
  heading :text => "Hook #2: production_loaded"

  directions :text => "This method is called after internal gems have been loaded and stages have been instantiated, yet before any scenes have been opened."
  line_break
  directions :text => "If you have business logic objects that are dependent on classes defined in a gem or you need to interact with the stage(s), you can access both here."
  
  line_break
  code :text => "module Production"
  code :text => "  def production_loaded"
  code :text => "  end"
  code :text => "end"
end

slide do
  heading :text => "Hook #3: production_opened"
  
  directions :text => "This method is called when the production, and all the scenes, have fully opened.  Since the scene is displayed at this point, you can make changes that will be immediately visible."
  
  line_break
  code :text => "module Production"
  code :text => "  def production_opened"
  code :text => "  end"
  code :text => "end"
end

slide do
  heading :text => "Hook #4: production_closing"
  
  directions :text => "This method is called when the production is about to be closed."
  
  line_break
  code :text => "module Production"
  code :text => "  def production_closing"
  code :text => "  end"
  code :text => "end"
end

slide do
  heading :text => "Hook #5: production_closed"
  
  directions :text => "This method is called when the production is fully closed."
  
  line_break
  code :text => "module Production"
  code :text => "  def production_closed"
  code :text => "  end"
  code :text => "end"
end

slide do
  heading :text => "Finished"
  directions :text => "Great!  Now you know all about Productions.  When you're ready, head to the next tutorial."
end
