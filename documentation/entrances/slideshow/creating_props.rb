slide do
  heading :text => "Creating Props In Limelight"
  directions :text => "Now that you've seen some of what Limelight can do, you're one of the cooler kids.  Now let's see how props are created."
  line_break
  directions :text => "To follow this tutorial simply click the next arrow in the top right corner and follow the directions on each page."
end

slide do
  heading :text => "1. Props"
  directions :text => "Props are the fundamental building blocks of a Scene. They form a tree structure where one Prop may contain other Props. In fact, the Scene is itself a Prop that is the root of all Props within it.  "
  line_break
  directions :text => "The syntax to define Props is as simple as possible. Limelight provides a DSL, or simple syntax, for building Props."
end

slide do
  heading :text => "2. Simple Prop"
  directions :text => "A prop can be named whatever you want.  To create a simple prop that displays text type this code into the box below and click run."
  sandbox_codeblock do
    code :text => "my_first_prop :text => 'show me!'"
  end
  
  __install "documentation/common/sandbox.rb"
end

slide do
  heading :text => "3. Nested Prop"
  directions :text => "Oftentimes you want a prop to live inside another.  Note you can only put text on an empty prop.  To create a nested prop:"
  sandbox_codeblock do
    code :text => "parent do"
    code :text => "  child :text => 'I am a child'"
    code :text => "end"
  end
  
  __install "documentation/common/sandbox.rb"
end

slide do
  heading :text => "4. Styling a Prop"
  directions :text => "Now let's give our props some style.  A prop takes a hash as a parameter where styles can be specified:"
  sandbox_codeblock do
    code :text => "prop :width => '100', :height => '100', :border_color => 'red', :border_width => '1', :text => 'With some bad style'"
  end
  
  __install "documentation/common/sandbox.rb"
end

slide do
  heading :text => "5. Events"
  directions :text => "Every prop has a number of events to which it can respond.  One of these events is mouse_clicked.  To respond to an event, you need to set the handler code for the event."
  sandbox_codeblock do
    code :text => "prop :text => \"Click to change my color!\", :text_color => :blue, "
    code :text => " :on_mouse_clicked => \"style.text_color = :red\""
  end
  
  __install "documentation/common/sandbox.rb"
end

slide do
  heading :text => "6. Putting it all together"
  directions :text => "Now let's put our new skills together with some nested boxes."
  sandbox_codeblock do
    code :text => "outer_box :width => 100, :border_color => :red, :border_width => 3, :margin => 5 do"
    code :text => "  inner_box :margin => 10, :padding => 10, :border_color => :blue, :border_width => 2, :text => \"Look at me!\""
    code :text => "end"
  end
  
  __install "documentation/common/sandbox.rb"
end

slide do
  heading :text => "7. Finished"
  directions :text => "Great!  Now you know how to create props.  When you're ready, head to the next tutorial."
end
