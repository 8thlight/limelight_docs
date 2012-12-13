slide do
  heading :text => "Built-in Players"
  directions :text => "In addition to the ability to add behavior to Props yourself, you can use the built-in players provided by Limelight.  These players are especially useful for the kind of controls you wouldn't want to write yourself, such as generic buttons and text areas.  To specify a default player you can simply add it to the players attribute in the Prop definition."
  line_break
  directions :text => "Let's get started."
end

slide do
  heading :text => "Important!"
  directions :text => "One important thing to note is that you do not name the player as the built-in player, but instead add it to the players attribute."
  line_break
  directions :text => "This will work:"
  codeblock do
    code :text => "label :players => 'built_in_player', :text => 'Hello!'"
  end
  line_break
  directions :text => "This will NOT work:"
  codeblock do
    code :text => "built_in_player :text => 'Hello!'"
  end
  directions :text => "For example, 'text_box' is a built-in Prop.  This is the correct way to create one called 'my_text_box':"
  line_break
  codeblock do
    # -------------------------------------------------------------------------------------
    # -- the extra apostrophe at the end is needed to get the code to display correctly --
    # -------------------------------------------------------------------------------------
    code :text => "my_text_box :players => 'text_box', :text => 'Hello!''"
  end
end

slide do
  heading :text => "Image"
  directions :text => "Possibly the simplest Player is the image.  It's the easiest way to project an image onto the screen by using the provided image attribute.  To see what the file image.png looks like, use the code below.  Note how the image is scaled and shrunk to fit."
  
  sandbox_codeblock do
    code :text => "image_prop :players => 'image', :image => 'images/image.jpg', :scaled => true, :height => 190"
  end

  __install "documentation/common/prop_sandbox.rb", :height => 190
end

slide do
  heading :text => "Text"
  directions :text => "Eventually, whether you want them to or not, users are going to want to type in some data.  Text Areas and Text Boxes work just the way you'd expect.  To read the data in a text Prop you access its text property.  Let's show them here:"
  
  sandbox_codeblock do
    code :text => "text_area_prop :players => 'text_area'"
    code :text => "text_box_prop :players => 'text_box'"
  end

  __install "documentation/common/prop_sandbox.rb", :height => 190
end

slide do
  heading :text => "Multiple Players"
  directions :text => "Before we continue with more text events, let's go more in depth with multiple Players.  You've seen how to add multiple Players to a single Prop, but what does that do for us?  When you have multiple Players on a Prop, any events taken on this Prop will call the methods for those events on all the Players on the Prop, not just one of them."
  line_break
  directions :text => "Here we have a prop with players PlayerOne and PlayerTwo.  When this prop is clicked, the mouse_clicked event will be called on both of those modules."
  codeblock do
    # -------------------------------------------------------------------------------------
    # -- the extra apostrophe at the end is needed to get the code to display correctly --
    # -------------------------------------------------------------------------------------
    code :text => "label :text => 'Hello', :players => 'player_one, player_two''"
  end
  
end

slide do
  heading :text => "Custom Text Events"
  directions :text => "We can use the idea of multiple Player to add custom events to a built-in Player.  The next examples will do this using the text_area Player. Text input fields can detect key presses and focus changes. To add behavior when those events occur, you add a second Player to the prop as shown on the previous slide."
  line_break
  directions :text => "In this example the Text Area below would first mixin the text_area player, then also mixin the Custom Player of your own design.  In the upcoming steps we'll describe how to implement the needed events."
  line_break
  codeblock do
    # -------------------------------------------------------------------------------------
    # -- the extra apostrophe at the end is needed to get the code to display correctly --
    # -------------------------------------------------------------------------------------
    code :text => "text_area_prop :players => 'text_area, custom''"
  end
end

slide do
  heading :text => "Key Presses"
  directions :text =>  "Key presses are detected by any of the built-in Players, and can be handled by your Custom Player.  The same is true for key releases and key types.  The event in the key press will contain the key that was pressed.  What, you thought it was hard?  Applying the code below to the Prop on the screen will allow you to count key presses and releases."
  
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
  directions :text => "The focus of the control can also be dectected.  When focus is gained or lost an event is sent.  Let's use the focus change to change the color of a Prop.  When the focus leaves the text area on the left the Prop will turn blue, when focus is regained it will turn red."
  
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
  directions :text => "We're done with the text_area Player and now it's time to move on to a few more built-in Players.  There are three variations on the same theme that we will discuss next: the Button, the Checkbox and the Radio Button.  These work as you might expect, with the Checkbox and Radio Buttons having extra attributes in order to create them.  The two props on the scene here are a Checkbox that is checked, and a traditional button."
  
  sandbox_codeblock do
     code :text => "button_prop :players => 'button', :text => 'button'"
     code :text => "checkbox_prop :players => 'check_box', :checked => true"
   end

   __install "documentation/common/prop_sandbox.rb", :height => 140
end

slide do
  heading :text => "Radio Button"
  directions :text => "The Radio Button requires a small amount of explanation.  Only one radio button in any group can be selected at one time.  Radio Buttons are grouped by assigning the same group name to the group attribute."
  line_break
  directions :text => "After running the code below, change the group name of one of the buttons and observe the resulting behavior."
  sandbox_codeblock do
     code :text => "radio_button_prop :players => 'radio_button',"
     code :text => "                  :group => 'button_group'"
     code :text => "radio_button_prop :players => 'radio_button',"
     code :text => "                  :group => 'button_group'"
     code :text => "radio_button_prop :players => 'radio_button',"
     code :text => "                  :group => 'button_group'"
   end

   __install "documentation/common/prop_sandbox.rb", :height => 120, :text_area_height => 200
end

slide do
  heading :text => "Button Pressed Event"
  directions :text => "These new Players introduce a new event - the button press.  This can be implemented to respond to a button press in all the ways you might expect.  The props below are setup with a button and a Prop, with this code you can make that Prop turn red."
 
  sandbox_codeblock do
    code :text => "def button_pressed(event)"
    code :text => "  box_prop = scene.find('box_prop')"
    code :text => "  box_prop.style.background_color = :red"
    code :text => "end"
  end
  
  __install "documentation/common/players_sandbox.rb", :prop_file => "documentation/entrances/player_examples/button_props.rb", :height => 140, :text_area_height => 100
end

slide do
  # ------------------
  # -- this crashes --
  # ------------------
  heading :text => "Combo Box Player"
  directions :text => "The last built-in Player is the Combo Box.  The Combo Box is setup with an array of possible choices and the current value.  Don't you wish HTML was this simple?"
  
  sandbox_codeblock do
    code :text => "combo_box_prop :players => 'combo_box', :choices => ['blue', 'red', 'green', 'black'], :value => 'black'"
  end
  
  __install "documentation/common/prop_sandbox.rb"
  #__install "documentation/common/players_sandbox.rb", :prop_file => "documentation/entrances/player_examples/combo_box_props.rb", :text_area_height => 100
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
  
  __install "documentation/common/players_sandbox.rb", :prop_file => "documentation/entrances/player_examples/combo_box_props.rb", :text_area_height => 100
end

__install "documentation/common/finished_slide.rb"