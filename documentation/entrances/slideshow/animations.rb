slide do
  directions :text => "Animations are a great way to create smooth transitions in your Production or otherwise make it shine."
  line_break
  directions :text => "Composing animations in Limelight is really simple.  Let's take a look at how it is done."
end
    
slide do
  heading :text => "The animate method"
  directions :text => "When animate is called on a prop, an animation loop is instantiated.  This is most commonly done in an event handler in a player."
  
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
  directions :text => "The block passed to the animate method will be invoked the specified number of times per second (the default is 60), until the Animation is stopped.  The default value should work well in most cases."
  
  line_break
  directions :text => "Note that this is not the same as frames per second.  This value affects the frequency in which the code block is executed.  Setting this value above 60 will actually begin to degrade performance and likely decrease the frame rate, especially if the animation block uses many cycles each update."
  
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
  directions :text => "In this example, we are going to animate the movement of a Prop based on a mouse click."
  line_break
  directions :text => "Click in the box to make the text move there."
  line_break
  __install "documentation/entrances/animation_examples/here_boy.rb"
end

slide do
  heading :text => "Props"
  directions :text => "Here are the props for this example.  Add this to your Limelight production to see this in action."
  
  codeblock do
    code :text => "animation_container do"
    code :text => "  label :id => \"animated_text\", :text => \"Hello, World!\""
    code :text => "end"
  end
  
  directions :text => "...and some styles for the props."
  
  codeblock do
    code :text => "animation_container {"
    code :text => "  background_color :black"
    code :text => "  width \"100%\""
    code :text => "  height \"100%\""
    code :text => "}"
    code :text => "animated_text {"
    code :text => "  float :on"
    code :text => "  font_size 50"
    code :text => "  text_color :green"
    code :text => "}"
  end
  
end

slide do
  heading :text => "Animation"
  directions :text => "Now add a handler for the mouse_clicked of the animation_container prop.  Open up players/animation_container.rb."
  codeblock do
    
    code :text => "module AnimationContainer"
    code :text => "  def mouse_clicked(e)"
    code :text => "    label = scene.find(\"animated_text\")"
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

__install "documentation/common/finished_slide.rb"