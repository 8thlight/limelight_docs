slide do
  directions :text => "Animations are a great way to create smooth transitions in your Production or otherwise make it shine"
  line_break
  directions :text => "Composing animations in Limelight can be really simple.  Let's take a look at how it is done."
end

slide do
  heading :text => "The animate method"
  directions :text => "When animate is called on a prop, an animation loop is instantiated.  This is most likely to be done in an action handler on a player."
  
  codeblock do
    code :text => "@animation = animate do"
    code :text => "  # Animation code goes here"
    code :text => "end"
  end
  
end

slide do
  heading :text => "Updates Per Second"
  directions :text => "The number of updates per second can be specified when creating the animation."
  line_break
  codeblock {code :text => "@animation = animate({:updates_per_second => 30})"}
    
  line_break
  directions :text => "The block passed to the animate method will be invoked the specified number of times per second (the default is 60), until the Animation is stopped.  The default value should work well for you in most cases."
  
  line_break
  directions :text => "Note that this is not the same as frames per second.  This value affects the frequency in which the code block is invoked.  Setting this value above 60 will actually begin to degrade performance and likely decrease the frame rate."
  
end

slide do
  heading :text => "Stopping an Animation"
  
  directions :text => "An Animation object is returned from the animate method.  Hold on to that object so that it can be stopped.  This is typically done from inside the animation block."
  line_break
  codeblock do
    code :text => "@animation = animate do"
    code :text => "  if stop_condition"
    code :text => "    @animation.stop"
    code :text => "  end"
    code :text => "end"
  end
  
  line_break
  
  directions :text => "The animate method will start your animation, and the block passed to animate will be run until @animation.stop is called."
  line_break
  directions :text => "Remember to stop the animation, otherwise your Production will continue using computer cycles to run the animation loop."
end

slide do
  heading :text => "Example Animation"
  directions :text => "In this example, we are going to animate the movement of a label based on a mouse click.  A working example can be seen below."
  line_break
  directions :text => "Click in the box to make the text move there."
  line_break
  __install "documentation/entrances/animation_examples/here_boy.rb"
end

slide do
  heading :text => "Props"
  directions :text => "Here are the props for this example:"
  
  codeblock do
    code :text => "animation do"
    code :text => "  label :id => \"label\", :name => \"label\", :text => \"Animate Me!\""
    code :text => "end"
  end
  
  directions :text => "...and some styles for the props."
  
  codeblock do
    code :text => "animation {"
    code :text => "  background_color :black"
    code :text => "  width \"100%\""
    code :text => "  height \"100%\""
    code :text => "}"
    code :text => "label {"
    code :text => "  float :on"
    code :text => "  font_size 50"
    code :text => "  text_color :green"
    code :text => "}"
  end
  
end

slide do
  heading :text => "Animation"
  directions :text => "Let's add a handler for the mouse_clicked of the animation prop.  Open up players/animation.rb."
  codeblock do
    
    code :text => "module Animation"
    code :text => "  def mouse_clicked(e)"
    code :text => "    label = scene.find(\"label\")"
    code :text => "    @animation.stop if @animation"
    code :text => "    @dx = label.style.x.to_i < e.x ? 1 : -1"
    code :text => "    @dy = label.style.y.to_i < e.y ? 1 : -1"
    code :text => "    @animation = animate do"
    code :text => "      on_x = label.style.x.to_i == e.x"
    code :text => "      on_y = label.style.y.to_i == e.y"
    code :text => "      if on_x && on_y"
    code :text => "        @animation.stop"
    code :text => "      else"
    code :text => "        label.style.x = (label.style.x.to_i + @dx).to_s if !on_x"
    code :text => "        label.style.y = (label.style.y.to_i + @dy).to_s if !on_y"
    code :text => "      end"
    code :text => "    end"
    code :text => "  end"
    code :text => "end"
    
  end
  
  directions :text => "When you run your production now, your label should now follow your mouse clicks!"
  
end

slide do
  heading :text => "Finished"
  directions :text => "You now know the basics of animations in Limelight.  When you're ready, head to the next tutorial."
end

# slide do
#   heading :text => "Your Turn - Create a New Production"
#   directions :text => "Let's build this simple animation.  First, create a new Limelight production."
#   codeblock do
#     code :text => "limelight create production animation_walk_through"
#   end
# end
# 
# slide do
#   heading :text => "Your Turn - Setting the Stage"
#   directions :text => "We'll just work with the default_scene.  Open up default_scene/props.rb and replace all of the code with this."
#   line_break
#   codeblock do
#     code :text => "animation do"
#     code :text => "  label :id => \"label\", :text => \"Hello, World!\""
#     code :text => "end"
#   end
# end
# 
# slide do
#   heading :text => "Your Turn - Styling"
#   directions :text => "Let's give our props some style before animating the scene.  Open up default_scene/styles.rb and replace all of the code with this."
#   
#   codeblock do
#     code :text => "animation {"
#     code :text => "  background_color :black"
#     code :text => "  width \"100%\""
#     code :text => "  height \"100%\""
#     code :text => "}"
# 
#     code :text => "label {"
#     code :text => "  float :on"
#     code :text => "  x 50"
#     code :text => "  y 50"
#     code :text => "  font_size 50"
#     code :text => "  text_color :green"
#     code :text => "}"
#   end
#   
#   directions :text => "Go ahead and run your production to see what it looks like.  Feel free to style it any way you want, just make sure that the label's float attribute remains set to :on.  This will allow your animation to change the location of the text."
# end
# 
# slide do
#   heading :text => "Your Turn - Add a Player"
#   directions :text => "We need to add a player for Animation to handle this, so create a file at:"
#   codeblock do
#     code :text => "default_scene/players/animation.rb"
#   end
#   directions :text => "You should also (as always) create a spec file for this player at:"
#   codeblock do
#     code :text => "animation_walkthrough/spec/default_scene/players/animation_spec.rb"
#   end
#   
# end
# 
# slide do
#   heading :text => "animation_spec.rb"
#   directions :text => "Let's write a failing test.  We want a method that allows the position of a prop with an id of \"label\" to be set."
#   codeblock do
#     
#   end
#   
# end

# slide do
#   heading :text => "Example Animation - Props"
#   directions :text => "The props for this example are defined like this."
#   codeblock do
#     code :text => "sample_animation do"
#     code :text => "  label :id => \"label\", :text => \"Hello, World!\""
#     code :text => "        :text_color => :green, :font_size => 50,"
#     code :text => "        :float => :on"
#     code :text => "end"
#   end
#   
#   directions :text => "Note that the id of the prop that we want to move is \"label\".  We will use that to find the prop."
#   line_break
#   directions :text => "Also take notice of the :float => :on style.  This will allow the label to be repositioned by the animation."
# end
# 
# slide do
#   heading :text => "Make it Work"
#   directions :text => "Now it's your turn to write the animation code."
#   line_break
#   
#   __install "documentation/common/players_sandbox.rb", :prop_file => "documentation/entrances/animation_examples/neutered_here_boy.rb"
# end

