slide do
  line_break
  directions :text => "We've seen how to create Players in Limelight, but not what we can do with these Players.  The next step is to add behavior to these players by creating methods in the module representing the Player."
  line_break
  directions :text => "Let's get started with a simple example of changing a prop's style"
end

slide do
  heading :text => "Change Style"
  
  directions :text => "In order to do anything interesting you have to be able to manipulate the Scene.  You've seen this already in the previous examples, where the first thing done is to find a Prop in the Scene, and then do something with it.  The Prop below is red, but when it is clicked I want it to turn black and move to the right."
  line_break
  directions :text => "Fortunately all props have a style object, which you can change.  The code below will make the text change when you click it.  Note: The Run button will not change the text - it will only add the mouse_clicked behavior.  You must click Apply to apply the behavior, then click the example Prop to see it."
  
  sandbox_codeblock do
    code :text => "def mouse_clicked(e)"
    code :text => "  prop = scene.find('red_prop')"
    code :text => "  prop.style.text_color = :black"
    code :text => "  prop.style.left_padding = 10"
    code :text => "end"
  end

  __install "documentation/common/players_sandbox.rb", :prop => 'prop_to_extend :id => "red_prop", :text => "I am red, make me black.", :text_color => :red', :height => 90, :text_area_height => 200
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

  __install "documentation/common/players_sandbox.rb", :prop => 'prop_to_extend :id => "found_prop", :text => "Blue", :text_color => :blue, :font_size => 24', :height => 100
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
  
  __install "documentation/common/players_sandbox.rb", :prop => 'prop_to_extend :width => "100%", :height => "100%", :border_width => 1, :border_color => :black', :height => 120
  
end

slide do
  heading :text => "Mouse Movement"
  directions :text => "You can also just track movement inside the Prop's area.   As the mouse moves over the section below it will get more ad more transparent, assuming you apply the code snippet of course."
  
  sandbox_codeblock do
    code :text => "def mouse_moved(event)"
    code :text => "  self.style.transparency = (self.style.transparency.to_i + 1) % 100"
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
  heading :text => "Cast"
  directions :text => "When Players are put into a Production they are cast.  In limelight the casted method is called when Players are first put into a Scene.  Use this for any initialization needed for the Player, and remember Players are modules so overriding initialize is a big no no."
  
  codeblock do
    code :text => "def casted"
    code :text => "  # Here I do setup"
    code :text => "end"
  end
end

slide do
  heading :text => "Testing"
  directions :text => "Testing Player behavior is done using the RSpec tests generated with the Production.  In order to test a Player the simplest thing to do is load the Scene and find the Prop, at which point you call methods on the Prop directly.  You saw this test in the Getting Started tutorial:"
  
  codeblock do
    code :text => "it 'should change the root scene text when it is clicked' do"
    code :text => "  root = scene.children[0]"
    code :text => "  root.mouse_clicked(nil)"
    code :text => "  root.text.should == \"Hello Limelight!\""
    code :text => "end"
  end
  
  line_break
  directions :text => "Each spec for a Scene has the following directive just below the describe block:"
  
  codeblock do
    code :text => "describe \"MyScene\""
    code :text => "  uses_scene :my_scene"
  end
  
  line_break
  directions :text => "This will load the Scene for you, and you can use the scene method to access it in your specs."
end
  
__install "documentation/common/finished_slide.rb"