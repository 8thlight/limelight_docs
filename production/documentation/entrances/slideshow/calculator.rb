slide do
  heading :text => "Building a Calculator"
  line_break
  directions :text => "Up until this point, all of the walkthroughs has been showing you just a part of Limelight.  In this walkthrough, we will build simple calculator starting from generating an empty to Production finishing with a working calculator."
end

slide do
  heading :text => "1. Generate the Production"
  line_break
  directions :text => "The first step in creating a Limelight Production is to generate an empty Production.  At a terminal, run the following command:"
  line_break
  codeblock do
    code :text => "bash$ limelight create production calculator"
  end
  line_break
  directions :text => "This creates the default Production as you saw in the Getting Started walkthrough."
end

slide do
  heading :text => "2. Add the Calculator Keys"
  line_break
  directions :text => "Now that we have the Production generated, we can get started on the calculator.  The next step is to add the buttons to the props.rb file in the default scene.  Don't to clear out the existing props and styles."
  line_break
  codeblock do
    code :text => "calculator_button :text => 0"
    code :text => "calculator_button :text => 1"
    code :text => "calculator_button :text => 2"
    code :text => "calculator_button :text => 3"
    code :text => "calculator_button :text => 4"
    code :text => "calculator_button :text => 5"
    code :text => "calculator_button :text => 6"
    code :text => "calculator_button :text => 7"
    code :text => "calculator_button :text => 8"
    code :text => "calculator_button :text => 9"
    code :text => "calculator_button :text => '+'"
    code :text => "calculator_button :text => '-'"
    code :text => "calculator_button :text => '*'"
    code :text => "calculator_button :text => '/'"
  end
  line_break
  directions :text => "This will give us this:"
  screenshot_div do
    screenshot :image => "images/calculator/001_add_numbers.png", :players => "image"
  end
  
end

slide do
  #styling the number keys
  heading :text => "3.a Styling the Keys"
  line_break
  directions :text => "Now that we have the keys displayed on the screen we need to do some work to make them look better."
  line_break
  directions :text => "First we need to make some slight changes to the props file to arrange the props in the way we want to.  As you can see, we are going to be styling the number keys differently than we are styling the function keys."
  line_break
  codeblock do
    code :text => 'row do'
    code :text => '  calculator_button :text => 7, :styles => "calculator_number"'
    code :text => '  calculator_button :text => 8, :styles => "calculator_number"'
    code :text => '  calculator_button :text => 9, :styles => "calculator_number"'
    code :text => '  calculator_button :text => "+", :styles => "calculator_function"'
    code :text => 'end'
    code :text => 'row do'
    code :text => '  calculator_button :text => 4, :styles => "calculator_number"'
    code :text => '  calculator_button :text => 5, :styles => "calculator_number"'
    code :text => '  calculator_button :text => 6, :styles => "calculator_number"'
    code :text => '  calculator_button :text => "-", :styles => "calculator_function"'
    code :text => 'end'
    code :text => 'row do'
    code :text => '  calculator_button :text => 1, :styles => "calculator_number"'
    code :text => '  calculator_button :text => 2, :styles => "calculator_number"'
    code :text => '  calculator_button :text => 3, :styles => "calculator_number"'
    code :text => '  calculator_button :text => "*", :styles => "calculator_function"'
    code :text => 'end'
    code :text => 'row do'
    code :text => '  calculator_button :text => 0, :styles => "calculator_number"'
    code :text => '  calculator_equals :text => "=", :styles => "calculator_function"'
    code :text => '  calculator_button :text => "/", :styles => "calculator_function"'
    code :text => 'end'
  end
end

slide do
  heading :text => "3.b Styling the Keys cont"
  line_break
  directions :text => "The next step is to define the styles for our buttons.  These all go in the default_scene styles.rb file.  As you can see, even though the number keys and the function keys are appear differently, they do share some common styling.  Feel free to play around with these styles."
  line_break
  codeblock do
    code :text => "default_scene {"
    code :text => "  gradient :on"
    code :text => "  background_color '#555'"
    code :text => "  secondary_background_color '#777'"
    code :text => "  vertical_alignment :center"
    code :text => "  width '100%'"
    code :text => "  height '100%''"
    code :text => "}"
    code :text => ""
    code :text => "row {"
    code :text => "  width '100%'"
    code :text => "  horizontal_alignment :center"
    code :text => "}"
    code :text => ""
    code :text => "calculator_button {"
    code :text => "  height 130"
    code :text => "  width 130"
    code :text => "  rounded_corner_radius 60"
    code :text => "  border_color :black"
    code :text => "  border_width 1"
    code :text => "  horizontal_alignment :center"
    code :text => "  vertical_alignment :center"
    code :text => "  margin 5"
    code :text => "  gradient :on"
    code :text => "  font_size 48"
    code :text => "}"
    code :text => ""
    code :text => "calculator_number {"
    code :text => "  extends :calculator_button"
    code :text => "  background_color '#999'"
    code :text => "  secondary_background_color '#CCC'"
    code :text => "  hover {"
    code :text => "    border_color '#555'"
    code :text => "    background_color '#AAA'"
    code :text => "    secondary_background_color '#DDD'"
    code :text => "  }"
    code :text => "}"
    code :text => ""
    code :text => "calculator_function {"
    code :text => "  extends :calculator_button"
    code :text => "  background_color '#a76200'"
    code :text => "  secondary_background_color '#db8100'"
    code :text => "  hover {"
    code :text => "    background_color '#db8100'"
    code :text => "    secondary_background_color '#ff9600'"
    code :text => "  }"
    code :text => "}"
  end
end

slide do
  heading :text => "3.c Styling the Keys cont"
  line_break
  directions :text => "Here you can see the effects of our style changes."
  screenshot_div do
    screenshot :image => "images/calculator/002_style_keys.tiff", :width => "70%", :players => "image"
  end
end

slide do
  heading :text => "4.a Adding a Display"
  directions :text => "The next step would be to add behavior to the keys we have so far, but what they will be doing is updating a display.  Which means we first need to add the display that they can update."
  line_break
  directions :text => "First add another row to the beginning of the props.rb file containing a child prop with the id of \"display.\"  We will be using this id to find the Prop on mouse_clicked events."
  line_break
  codeblock do
    code :text => 'row do'
    code :text => '  display :id => "display"'
    code :text => 'end'
    code :text => "."
    code :text => "."
    code :text => "."
  end
  line_break
  directions :text => "And for the styling we add this."
  line_break
  codeblock do
    code :text => 'display {'
    code :text => '  font_size 48'
    code :text => '  height 54'
    code :text => '  width 500'
    code :text => '  background_color :white'
    code :text => '  border_color "#AAA"'
    code :text => '  border_width 1'
    code :text => '  horizontal_alignment :right'
    code :text => '  vertical_alignment :center'
    code :text => '  right_padding 5'
    code :text => '  bottom_margin 5'
    code :text => '}'
  end
end

slide do
  #look at new awesomeness
  heading :text => "4.b Adding a Display cont"
  line_break
  directions :text => "Here's what our added display looks like.  Our calculator is starting to take shape."
  screenshot_div do
    screenshot :image => "images/calculator/003_display.tiff", :width => "70%", :players => "image"
  end
end

slide do
  #adding behavior for the non-equal keys
  heading :text => "5. Handling Key Presses"
  line_break
  directions :text => "Now that we have all the buttons on the screen we need to enable them to update the display.  This will define the behavior for all the keys except the equals key."
  line_break
  directions :text => "First create a player in the default_scene named calculator_button.rb.  Next, add the following code to the player"
  codeblock do
    code :text => 'module CalculatorButton'
    code :text => '  def mouse_clicked(event)'
    code :text => '    scene.find("display").text += self.text'
    code :text => '  end'
    code :text => 'end'
  end
end

slide do
  heading :text => "6.a Equals Key"
  line_break
  directions :text => "Next we have to define the behavior for the equals key.  We want to evaluate the given expression and update the display with the result."
  line_break
  directions :text => "First create another player in the default_scene and name this one calculator_equals.  Give it the following code."
  line_break
  codeblock do
    code :text => 'module CalculatorEquals'
    code :text => '  def mouse_clicked(event)'
    code :text => '    display = scene.find("display")'
    code :text => '    display.text = eval(display.text)'
    code :text => '  end'
    code :text => 'end'
  end
end

slide do
  heading :text => "6.b Equals Key cont"
  line_break
  directions :text => "We can also add some error handling in to the CalculatorEquals Player.  In the case of a bad expression, we just clear the display."
  line_break
  codeblock do
    code :text => 'module CalculatorEquals'
    code :text => '  def mouse_clicked(event)'
    code :text => '    display = scene.find("display")'
    code :text => '    begin'
    code :text => '      display.text = eval(display.text)'
    code :text => '    rescue SyntaxError'
    code :text => '      display.text = ""'
    code :text => '    end'
    code :text => '  end'
    code :text => 'end'
  end
end

slide do
  heading :text => "7.a Clear Key"
  line_break
  directions :text => "As of now, we have a working calculator that performs basic arithmetic operations.  However, lets add the ability to clear the display.  Let's add the button to the last row of props."
  line_break
  codeblock do
    code :text => 'row do'
    code :text => '  calculator_button :text => 0, :styles => "calculator_number"'
    code :text => '  calculator_equals :text => "=", :styles => "calculator_function"'
    code :text => '  calculator_button :text => "/", :styles => "calculator_function"'
    code :text => '  calculator_clear :text => "C"'
    code :text => 'end'
  end
  line_break
  directions :text => "Lets also give define a style for it in the styles.rb file."
  line_break
  codeblock do
    code :text => 'calculator_clear {'
    code :text => '  extends :calculator_button'
    code :text => '  background_color "#6f0000"'
    code :text => '  secondary_background_color "#920000"'
    code :text => '  hover {'
    code :text => '    background_color "#910000"'
    code :text => '    secondary_background_color "#a90000"'
    code :text => '  }'
    code :text => '}'
  end
end

slide do
  heading :text => "7.b Clear Key cont"
  line_break
  directions :text => "Now to define the behavior for the clear key.  Create a third player named calculator_clear.rb and give it the following behavior.  It simply finds the display prop and sets the text to empty string."
  line_break
  codeblock do
    code :text => 'module CalculatorClear'
    code :text => '  def mouse_clicked(event)'
    code :text => '    scene.find("display").text = ""'
    code :text => '  end'
    code :text => 'end'
  end
end

slide do
  heading :text => "Finished!"
  line_break
  directions :text => "This completes the calculator production.  Feel free to play around with it below.  If you have completed your calculator correctly, it should behave like the one here."
  line_break
  calculator_production do
    __install "documentation/calculator_props.rb"
  end
end

slide do
  heading :text => "What Next?"
  line_break
  directions :text => "If you'd like, you can try adding more operations to the calculator, such as a square root, factorial or parentheses.  You can also try to change the calculator to behave more like an actual calculator."
end