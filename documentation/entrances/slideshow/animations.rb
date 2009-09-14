slide do
  directions :text => "Composing animations in Limelight is really simple.  Let's take a look at a few of the concepts first, then we'll animate some text moving within a Scene."
end

slide do
  heading :text => "animate"
  
  directions :text => "There is an animate method on the Prop that can be called to begin an animation.  For example, in response to a mouse_clicked event you could do this to begin an animation."
  line_break
  code :text => "def mouse_clicked(e)"
  code :text => "  @animation = animate do"
  code :text => "    # Animation code goes here"
  code :text => "    # Don't forget to call @animation.stop"
  code :text => "  end"
  code :text => "end"
  
  line_break
  
  directions :text => "The animate method will start your animation, and the block passed to animate will be run until @animation.stop is called."
end

slide do
  heading :text => "Updates per Second"
  directions :text => "The number of updates per second can be specified when creating the animation.  This will default to 60 if you do not specify a value."
  line_break
  directions :text => "The default value should work well for you in most cases."
  line_break
  code :text => "@animation = animate({:updates_per_second => 30})"
  line_break
  directions :text => "Note that this is not the same as frames per second.  This value affects the frequency that the code block is invoked.  Setting this value above 60 will actually begin to degrade performance and thus the frame rate."
end

slide do
  heading :text => "Example Animation"
  directions :text => "In this example, we are going to animate the movement of a label based on a mouse click.  The working example can be seen below."
  line_break
  directions :text => "The props for this example are defined like this.  Note in particular the :float => :on style.  This allows the label to be repositioned by the animation."
  line_break
  code :text => "sample_animation do"
  code :text => "  label :id => \"label\", :text => \"Hello, World!\", "
  code :text => "        :text_color => :green, :font_size => 50, "
  code :text => "        :float => :on"
  code :text => "end"
  line_break
  directions :text => "Click in the black box to make the text move there."
  line_break
  __install "documentation/entrances/animation_examples/here_boy.rb"
end

slide do
  heading :text => "Make it Work"
  directions :text => "Now it's your turn to write the animation code."
  line_break
  
  __install "documentation/common/prop_sandbox.rb"
end

slide do
  heading :text => "Stopping the Animation"
  directions :text => "Remember to stop the animation, otherwise your Production will continue using computer cycles to run the animation loop.  As seen earlier, the call to animate returns an Animation object.  Just call stop on it to stop the animiation."
  
end