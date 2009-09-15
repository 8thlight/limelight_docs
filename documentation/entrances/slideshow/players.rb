slide do
  line_break
  directions :text => "All the worlds a stage and .... you get the drill.  Right now your Props may look pretty, but they can't do anything.  To add behavior to a Prop you create a Player, which is just a Ruby module that contains the Prop's behavior.  Let's dive into that right now."
end

slide do
  heading :text => "Who are the Players?"
  directions :text => "To link a Player to a Prop, you create a module with the same name as that Prop only capitalized.  For example this very application has a Player named NextButton that looks like this:"
  
  codeblock do
    code :text => "module NextButton"
    code :text => "  def mouse_clicked(event)"
    code :text => "    scene.find(\"slideshow\").next"
    code :text => "  end"
    code :text => "end"
  end
  
  line_break
  directions :text => "Now any Prop named next_button has this behavior, in this case advancing the slideshow."
end

slide do
  heading :text => "Player File"
  directions :text => "Each Scene has a directory named Players, which contains a Ruby module for each Player, and when the Scene is loaded it will attach the the Players to the Props in the Scene.  In addition there can be Production level Players.  Those are created by creating a players directory in the root directory of the Production and putting Players in it."
  line_break
  screenshot :image => "images/players.jpg", :players => "image"
end

slide do
  heading :text => "Players Attribute"
  directions :text => "Sometimes its inappropriate to name the Prop and the Player the same thing, or perhaps you want to mix-in more than one Player.  This can be done through the players attribute which is used just like the styles attribute."
  
  codeblock do
    code :text => "prop_using_players_attribute :players => 'NextButton, HighlightedButton', :text => 'I am text'"
  end
end

slide do
  heading :text => "Testing"
  directions :text => "Testing Player behavior is done using the RSpec tests generated with the Production.  In order to test a Player the simplest thing to do is load the Scene and find the Prop, at which point you call methods on the Prop directly.  You saw this test already:"
  
  codeblock do
    code :text => "it 'should change the root scene text when it is clicked' do"
    code :text => "  root = scene.children[0]"
    code :text => "  root.mouse_clicked(nil)"
    code :text => "  root.text.should == \"Hello Limelight!\""
    code :text => "end"
  end
  
  line_break
  directions :text => "Every spec has a scene method assuming you use the proper directive at the top of your describe block:" 
  
  codeblock do
    code :text => "it 'should change the root scene text when it is clicked' do"
    code :text => "  root = scene.children[0]"
    code :text => "  root.mouse_clicked(nil)"
    code :text => "  root.text.should == \"Hello Limelight!\""
    code :text => "end"
  end
  
  line_break
  directions :text => "Finally each spec for a Scene has the following directive just below the describe block:"
  
  codeblock do
    code :text => "describe \"MyScene\""
    code :text => "  uses_scene :my_scene"
  end
  
  line_break
  directions :text => "This will load the Scene for you, and you can use the scene method to access it in your specs."
end

slide do
  heading :text => "Change Style"
  
  directions :text => "In order to do anything interesting you have to be able to manipulate the Scene.  You've seen this already in thee above examples, where the first thing done is to find an element in the Scene, and then do something with it.  The Prop below is red, but when it is clicked I want it to turn black and move to the right.  This is done by finding that Prop in the Scene and manipulating its Style.  Fortunately all props have a style object, which you can change.  The code below will make the text change when you click it.  Note: The Run button will not change the text - it will only add the mouse_clicked behavior."
  
  sandbox_codeblock do
    code :text => "def mouse_clicked(e)"
    code :text => "  prop = scene.find('red_prop')"
    code :text => "  prop.style.text_color = :black"
    code :text => "  prop.style.left_padding = 10"
    code :text => "end"
  end

  __install "documentation/common/players_sandbox.rb", :prop => 'prop_to_extend :id => "red_prop", :text => "I am red, make me black.", :text_color => :red', :height => 90
end

slide do
  heading :text => "Events"
  directions :text => "All Players can respond to mouse events simply by implementing the necessary methods.  You've seen the mouse_clicked event a few times now.  You can also implement mouse_entered and mouse_exited.  Lets use this code to change the text when the mouse passes over a prop."
  
  
  sandbox_codeblock do
    code :text => "def mouse_entered(e)"
    code :text => "  prop = scene.find('found_prop')"
    code :text => "  prop.text = 'Gray'"
    code :text => "  prop.style.text_color = :gray"
    code :text => "end"
    line_break
    
    code :text => "def mouse_exited(e)"
    code :text => "  prop = scene.find('found_prop')"
    code :text => "  prop.text = 'Blue'"
    code :text => "  prop.style.text_color = :blue"
    code :text => "end"
  end

  __install "documentation/common/players_sandbox.rb", :prop => 'prop_to_extend :id => "found_prop", :text => "Blue", :text_color => :blue', :height => 100
end

slide do
  heading :text => "Mouse Pressed"
  directions :text => "You can implemement the mouse_pressed, mouse_dragged, and mouse_released methods.  Here's a simple example of dragging across an area.  When you press the color changes, when you drag it changes again, and when you release it changes back.  Note how self is used instead of finding the desired Prop.  Since the Player is mixed-in to the Prop, self is the Prop."
  
  sandbox_codeblock do
    code :text => "def mouse_pressed(event)"
    code :text => "  self.style.background_color = :yellow"
    code :text => "end"
    line_break
    
    code :text => "def mouse_released(event)"
    code :text => "  self.style.background_color = :blue"
    code :text => "end"
    line_break
    
    code :text => "def mouse_dragged(event)"
    code :text => "  self.style.background_color = :red"
    code :text => "end"
  end
  
  __install "documentation/common/players_sandbox.rb", :prop => 'prop_to_extend :width => "100%", :height => "100%", :border_width => 1, :border_color => :black', :height => 80
  
end

slide do
  heading :text => "Mouse Movement"
  directions :text => "You can also just track movement inside the Prop's area.   As the mouse moves over the section below it will get more ad more transparent, assuming you apply the code snippet of course."
  
  sandbox_codeblock do
    code :text => "def mouse_moved(event)"
    code :text => "  self.style.transparency = self.style.transparency.to_i + 1"
    code :text => "end"
  end
  
  __install "documentation/common/players_sandbox.rb", :prop => 'prop_to_extend :width => "100%", :height => "100%", :border_width => 1, :border_color => :black, :background_color => :red'
end

slide do
  heading :text => "Event Object"
  directions :text => "You probably noticed that each one of the mouse event methods takes an Event object.  These objects can be used to get information about the event.  In this case we can display the location of each mouse click."
  
  sandbox_codeblock do
    code :text => "def mouse_clicked(event)"
    code :text => "  self.text = \"Mouse Click at: \#{event.x}, \#{event.y}\""
    code :text => "end"
  end
  
  __install "documentation/common/players_sandbox.rb", :prop => 'prop_to_extend :text => "The mouse has not been clicked yet.", :width => "100%", :height => "100%"'
end  

slide do
  heading :text => "Built-in Players"
  directions :text => "In addition to the ability to add behavior to Props yourself, you can use the built-in players provided by Limelight.  These players are especially useful for the kind of controls you wouldn't want to write yourself, such as generic buttons and text areas.  To specify a default player you can simply add it to the players attribute in the Prop definition.  Let's get started."  
end

slide do
  heading :text => "Image"
  directions :text => "Possibly the simplest prop is the image prop.  It's the easiest way to project an image onto the screen by using the provided image attribute.  To see what the file image.png looks like, use the code below.  Note how the image is scaled and shrunk to fit."
  
  sandbox_codeblock do
    code :text => "image_prop :players => 'image', :image => 'images/image.jpg', :scaled => true, :height => 190"
  end

  __install "documentation/common/prop_sandbox.rb", :height => 190
end

slide do
  heading :text => "Text"
  directions :text => "Eventually, whether you want them to or not, users are going to want to type in some data.  Text Areas and Text Boxes work just the way you'd expect.  To read the data in the a text Prop you access its text property.  Let's show them here:"
  
  sandbox_codeblock do
    code :text => "text_area_prop :players => 'text_area'"
    code :text => "text_box_prop :players => 'text_box'"
  end

  __install "documentation/common/prop_sandbox.rb", :height => 190
end


slide do
  heading :text => "More Events"
  directions :text => "There are more built-in Players to come, but before we move on let's look at the new events that come available with the new Players we've just discussed.  The input fields can detect key presses and focus changes, and behave on them by adding a second player to their players hash.  For example the text area below would first mixin the text_area player, then also mixin a custom player of your own design.  These custom players can implement the new Events."
  
  codeblock do
    code :text => "text_box_prop :players => 'text_box, custom'"
  end
end

slide do
  heading :text => "Key Presses"
  directions :text =>  "Key presses are detected by any of the built in Players, and can be handled by your custom Players.  Ditto key releases and key types.  The event in the key press will contain the key....pressed.  What you thought it was hard?  Applying the code below to the Prop on the screen will allow you to count key presses and releases."
  
  sandbox_codeblock do    
    code :text => "def key_pressed(event)"
    code :text => "  key_presses_prop = scene.find('key_presses')"
    code :text => "  key_presses_prop.text = key_presses_prop.text.to_i + 1"
    code :text => "end"
    line_break
    
    code :text => "def key_released(event)"
    code :text => "  key_releases_prop = scene.find('key_releases')"
    code :text => "  key_releases_prop.text = key_releases_prop.text.to_i + 1"
    code :text => "end"
  end
  
  __install "documentation/common/players_sandbox.rb", :height => 120, :prop_file => "documentation/entrances/player_examples/typing_props.rb"
end

slide do
  heading :text => "Focus"
  directions :text => "The focus of the control can also be dectected.  When focus is gained or lost an event is sent.  Let's use the focus change to change the color of a Prop.  When the focus leaves the text area on the left the Prop will turn blue, when it is gained it will turn red."
  
  sandbox_codeblock do
    code :text => "def focus_gained(event)"
    code :text => "  box_prop = scene.find('box_prop')"
    code :text => "  box_prop.style.background_color = :red"
    code :text => "end"
    line_break
    
    code :text => "def focus_lost(event)"
    code :text => "  box_prop = scene.find('box_prop')"
    code :text => "  box_prop.style.background_color = :blue"
    code :text => "end"    
  end
  
  __install "documentation/common/players_sandbox.rb", :prop_file => "documentation/entrances/player_examples/focus_props.rb", :height => 125
end

slide do
  heading :text => "Buttons"
  directions :text => "If we might return to the built in Players for a moment, there are three variations on the same thing that we will discuss next: the Button, the Checkbox and the Radio Button.  These work as you might expect, with the Checkbox and Radio Buttons having extra fields to manipulate them.  The two props on the scene here are a Checkbox that is selected, and a traditional button."
  
  sandbox_codeblock do
     code :text => "button_prop :players => 'button', :text => 'button'"
     code :text => "checkbox_prop :players => 'check_box', :selected => true"
   end

   __install "documentation/common/prop_sandbox.rb", :height => 140
end

slide do
  heading :text => "Radio Button"
  directions :text => "The Radio Button requires a small amount of explanation.  Radio Buttons need to be grouped by a name in order to properly select and unselect the buttons. This is done with the group attribute."
    
  sandbox_codeblock do
     code :text => "radio_button_prop :players => 'radio_button', :group => 'button_group'"
     code :text => "radio_button_prop :players => 'radio_button', :group => 'button_group'"
     code :text => "radio_button_prop :players => 'radio_button', :group => 'button_group'"
   end

   __install "documentation/common/prop_sandbox.rb", :height => 120
end

slide do
  heading :text => "Button Pressed Event"
  directions :text => "These new Players introduce a new event - the button press.  This can be implemented to respond to a button press in all the normall ways you might expect.  For instance on this very page the sandbox where you type your code is a Text Area and the Run button is a Button.  With this code you can make a box turn red.  Hey we can't trust you with everything yet."
 
  sandbox_codeblock do
    code :text => "def button_pressed(event)"
    code :text => "  box_prop = scene.find('box_prop')"
    code :text => "  box_prop.style.background_color = :red"
    code :text => "end"
  end
  
  __install "documentation/common/players_sandbox.rb", :prop_file => "documentation/entrances/player_examples/button_props.rb", :height => 140
end

slide do
  heading :text => "Combo Box Player"
  directions :text => "The last built in Player is the Combo Box.  The Combo Box is setup with an array of possible choices, and the current value.  Don't you which HTML was this simple?"
  
  sandbox_codeblock do
    code :text => "combo_box_prop :players => 'combo_box', :choices => ['red', 'blue', 'green', 'black'], :value => 'black'"
  end
  
  __install "documentation/common/prop_sandbox.rb"
end

slide do
  heading :text => "Value Changed"
  directions :text =>  "Combo boxes have a unique event they respond to - the value_changed event.  In this example we'll be using the value_changed event to change the text to the right of the combo box."
  
  sandbox_codeblock do
    code :text => "def value_changed(event)"
    code :text => "  text_prop = scene.find('current_color')"
    code :text => "  text_prop.text = self.value"
    code :text => "end"
  end
  
  __install "documentation/common/players_sandbox.rb", :prop_file => "documentation/entrances/player_examples/combo_box_props.rb"
end

slide do
  heading :text => "Casted"
  directions :text => "Like the real Players in a Production, Players are casted when they are first placed on a scene.  The method casted should be overridden instead of overriding initialize to do any necessary setup, as you cannot know whether or not the current Player will be used in conjunction with any other Props."
  
  codeblock do
    code :text => "def casted"
    code :text => "  # Here I do setup"
    code :text => "end"
  end
end

slide do
  heading :text => "Finished"
  
  directions :text => "We covered a lot of information in this tutorial.  When you're ready, move on to the next one."
end