slide do
  line_break
  directions :text => "All the worlds a stage and .... you get the drill.  Right now your props may look pretty, but they can't do anything.  To add behavior to a prop you create a Player, which is just a Ruby module with the same name as your prop.  Let's dive into that right now."
end

slide do
  heading :text => "Who are the Players?"
  directions :text => "A Player is just a Ruby module that is linked to it's Prop through it's name.  For example this very application has a Player named NextButton that looks like this:"
  
  codeblock do
    code :text => "module NextButton"
    code :text => "  def mouse_clicked(event)"
    code :text => "    scene.find(\"slideshow\").next"
    code :text => "  end"
    code :text => "end"
  end
  
  line_break
  directions :text => "Each time Prop named next_button is placed in the scene it will aquire this behavior.  In the case advancing the slideshow."
end

slide do
  heading :text => "Player File"
  directions :text => "Each Limelight Scene has a directory named Players, which contains a Ruby module for each Player.  When that Scene is loaded it will attach the the Players to the Props in the Scene based on Prop names.  In addition there can be Production level Players.  Those are created by creating a players directory in the root directory of the Production, and putting players in it."
  
  screenshot :image => "images/players.jpg", :players => "image"
end

slide do
  heading :text => "Testing"
  directions :text => "Testing Player behavior is done using the RSpec tests generated with the limelight production.  In order to test a Player the simplest thing to do is load the Scene and find the Prop, at which point you call methods on the Prop directly.  You saw this test already:"
  
  codeblock do
    code :text => "it 'should change the root scene text when it is clicked' do"
    code :text => "  root = scene.children[0]"
    code :text => "  root.mouse_clicked(nil)"
    code :text => "  root.text.should == \"Hello Limelight!\""
    code :text => "end"
  end
  
  line_break
  directions :text => "The uses scene method to get the scene then finds the "
end

slide do
  heading :text => "Hooks..."
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
  heading :text => "Methods"
end

slide do
  heading :text => "Finished"
end