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
  heading :text => "Scene Manipulation"
  
  directions :text => "In order to do anything interesting you have to be able to manipulate the Scene.  You've scene this already in thee above examples, where the first thing done is to find an element in the scene, and then do something with it.  Let's go through some examples."
end

slide do
  heading :text => "Change Style"
  
  directions :text => "The prop above is blue, but when it is clicked I want it to turn black.  This is done by finding that Prop in the scene and manipulating it's style.  Fortunately all props have a style object, which you can change.  The code below will make the text change."
  
  players_codeblock do
    code :text => "def mouse_clicked(e)"
    code :text => "  prop = scene.find('red_prop')"
    code :text => "  prop.style.text_color = :black"
    code :text => "}"
  end
  
  canvas :id => "canvas" do
    red_prop :id => "red_prop", :text => "I am red, make me black"
  end

  __install "documentation/common/players_sandbox.rb"  
end

slide do
  heading :text => "Events"
  directions :text => "All Players can respond to mouse events simply by implementing the necessary methods.  Let's go through a few of them."
end

slide do
  heading :text => "Mouse Clicked"
  directions :text => "The simplest and most commonly used mouse event is the mouse_clicked event.  The code below shows a test - which you'll make pass by writing the mouse clicked method.  You loser.  "
end

slide do
  heading :text => "Casted"
  directions :text => "I have been casted for lunch"
end

slide do
  heading :text => "Builtin Players"
end

slide do
  heading :text => "Methods"
end

slide do
  heading :text => "Finished"
end

# mouse_clicked - Invoked  when the uses clicks on a Prop. More specifically, it's invoked when a mouse button is pressed and released all the while the location of the mouse is in the bounds of the Prop.
# mouse_entered - Invoked when the mouse enters the bounds of a Prop.
# mouse_exited - Invoked when the mouse, previously inside the Prop, move outside the bounds of the Prop.
# mouse_pressed - Invoked when a mouse button is pressed down while the mouse's location is within the bounds of the Prop.
# mouse_released - Invoked when a mouse button is released down while the mouse's location is within the bounds of the Prop.
# mouse_dragged - Invoked when the mouse's location changes within the bounds of the Prop while a mouse button is depressed.
# mouse_moved - Invoked when the mouse's location changes within the bounds of the Prop.
# key_typed - Invoked when a key is typed. only applicable to built-in input players
# key_pressed - Invoked when a key is pressed. only applicable to built-in input players
# key_released - Invoked when a key is released. only applicable to built-in input players
# focus_gained - Invoked when the keyboard focus is given to the Prop. only applicable to built-in input players
# focus_lost - Invoked when the keyboard focus is taken from the Prop. only applicable to built-in input players
# button_pressed - Invoked when a Prop's button is pressed. only applicable to the following built-in players: button, check_box, radio_button
# value_changed - Invoked when the value of a combo_box Prop is changed. only applicable to the combo-box built-in player