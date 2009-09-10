slide do
  line_break
  directions :text => "All the worlds a stage and .... you get the drill.  Right now your props may look pretty, but they can't do anything.  To add behavior to a Prop you create a Player, which is just a Ruby module that contains the Prop's behavior.  Let's dive into that right now."
end

slide do
  heading :text => "Who are the Players?"
  directions :text => "To link a Player to a Prop, you create a module with the same name as that Prop.  For example this very application has a Player named NextButton that looks like this:"
  
  codeblock do
    code :text => "module NextButton"
    code :text => "  def mouse_clicked(event)"
    code :text => "    scene.find(\"slideshow\").next"
    code :text => "  end"
    code :text => "end"
  end
  
  line_break
  directions :text => "Now any Prop named next_button has this behavior, in the case advancing the slideshow."
end

slide do
  heading :text => "Player File"
  directions :text => "Each Scene has a directory named Players, which contains a Ruby module for each Player, and when the Scene is loaded it will attach the the Players to the Props in the Scene.  In addition there can be Production level Players.  Those are created by creating a players directory in the root directory of the Production, and putting Players in it."
  line_break
  screenshot :image => "images/players.jpg", :players => "image"
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
  heading :text => "Events"
  mouse_clicked - Invoked when the uses clicks on a Prop. More specifically, it's invoked when a mouse button is pressed and released all the while the location of the mouse is in the bounds of the Prop.
  mouse_entered - Invoked when the mouse enters the bounds of a Prop.
  mouse_exited - Invoked when the mouse, previously inside the Prop, move outside the bounds of the Prop.
  mouse_pressed - Invoked when a mouse button is pressed down while the mouse's location is within the bounds of the Prop.
  mouse_released - Invoked when a mouse button is released down while the mouse's location is within the bounds of the Prop.
  mouse_dragged - Invoked when the mouse's location changes within the bounds of the Prop while a mouse button is depressed.
  mouse_moved - Invoked when the mouse's location changes within the bounds of the Prop.
  key_typed - Invoked when a key is typed. only applicable to built-in input players
  key_pressed - Invoked when a key is pressed. only applicable to built-in input players
  key_released - Invoked when a key is released. only applicable to built-in input players
  focus_gained - Invoked when the keyboard focus is given to the Prop. only applicable to built-in input players
  focus_lost - Invoked when the keyboard focus is taken from the Prop. only applicable to built-in input players
  button_pressed - Invoked when a Prop's button is pressed. only applicable to the following built-in players: button, check_box, radio_button
  value_changed - Invoked when the value of a combo_box Prop is changed. only applicable to the combo-box built-in player
end

slide do
  heading :text => "Events (might mean hooks)"
end

slide do
  heading :text => "Players attribute"
end

slide do
  heading :text => "Builtin Players"
end

slide do
  heading :text => "Scene Manipulation"
end

slide do
  heading :text => "Methods"
end

slide do
  heading :text => "Finished"
end