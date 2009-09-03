slide do
  line_break
  directions :text => "Up until now you've been adding styles directly to the props.  While this is nice for experimentation, it's not a great way to organize real production code.  Let's take a tour of the preferred way of setting up styles in Limelight, the styles DSL.  "
  line_break
  directions :text => "Along the way we'll also show you a few of the styles you haven't seen yet."
end

slide do
  heading :text => "The Styles File"
  directions :text => "You may recall from the Getting Started tutorial that each scene has a props.rb. which defines all it's props.  Alongside that file you can also create a styles.rb file, which will be automaticallly loaded with the scene.  In order to apply a style to a prop we simply give the style the same name as the prop being styled.  The syntax looks like this:"
  codeblock do
    code :text => "<propname> {"
    code :text => "  <stylename1> <attribute>"
    code :text => "  <stylename2> <attribute>"
    code :text => "..."
    code :text => "}"
  end
  directions :text => "Let's try this out with some examples."
end

slide do
  heading :text => "A Basic Style"
  directions :text => "The scene below you has one prop in it, interestingly named prop.  Currently it has no style, but you can help it out.  In the text area below enter the following then click run:"
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  text_color :blue"
    code :text => "}"
  end
  
  canvas :id => "canvas" do
    prop :text => "Turn Me Blue!", :id => "test_prop"
  end

  __install "documentation/common/styles_sandbox.rb"
end

slide do
  heading :text => "Text Attributes"
  directions :text => "This DSL should look familiar to CSS developers, but it is important to note that it is not the same.  Each style is actually defined as a Ruby block and does not have colons after the attributes or semicolons after the styles.  Let's try out a style with multiple attributes:"
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  transparency '50%'"
    code :text => "  border_width 10"
    code :text => "}"
  end
  
  canvas :id => "canvas" do
    prop :text => "Make me translucent with a border!", :id => "test_prop", :font_size => 14
  end

  __install "documentation/common/styles_sandbox.rb"
end

slide do
  heading :text => "Multiple Styles"
  directions :text => "Styles in the DSL just follow one after the other, without a delimeter.  It is simple to add styles for any of the props in your scenes.  Here's an example:"
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  text_color :red"
    code :text => "}"
    code :text => "prop2 {"
    code :text => "  background_color :blue"
    code :text => "  text_color :white"
    code :text => "}"
  end
  
  canvas :id => "canvas", :height => "160" do
    prop :text => "I am named prop      "
    line_break
    prop2 :text => "I am named prop2"
  end

  __install "documentation/common/styles_sandbox.rb"
end

slide do
  heading :text => "Values"
  directions :text => "The values for a style attribute can be a string, a symbol, or a number.  Numbers and symbols will only work when appropriate, such as using a symbol for horizontal_alignment or a number for width as shown below.  When in doubt use a string, as a string will always work even in the case of numbers"
  
  sandbox_codeblock do
    code :text => "interesting_values {"
    code :text => "  width 200"
    code :text => "  horizontal_alignment :center"
    code :text => "  text_color 'dark_red'"
    code :text => "}"
  end
  
  canvas :id => "canvas", :height => 150 do
    interesting_values :text => "I've got interesting values"
  end

  __install "documentation/common/styles_sandbox.rb"
end


slide do
  heading :text => "Multiple Props"
  
  directions :text => "As you might expect the style applies to every prop in the scene with that name, making it simple to create your own prop library.  On the left you see the style to change the colors of the props, and on the right the actual props as they are setup.  Go ahead and try it out."
  
  side_by_side_code :width => "100%" do
    sandbox_codeblock :width => "35%" do
      code :text => "green_prop {"
      code :text => "  text_color :green"
      code :text => "}"
    end
        
    codeblock :width => "65%" do
      code :text => "green_prop :text => 'Green'"
      code :text => "red_prop :text => 'Red'"
      code :text => "green_prop :text => 'Green'"
    end
  end
  
  canvas :id => "canvas" do
    green_prop :text => "Green"
    line_break
    red_prop :text => "Red"
    line_break
    green_prop :text => "Green"
  end

  __install "documentation/common/styles_sandbox.rb"
end

slide do
  heading :text => "Extending Styles"
  
  directions :text => "Styles tend to build on one another and the last thing we want is to introduce duplication.  Fortunately the extends directive will allow you to take one style and extend it to include a previously defined one, as shown here:"
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  text_color :purple"
    code :text => "}"
    code :text => "the_prop {"
    code :text => "  extends :prop"
    code :text => "  border_width 3"
    code :text => "}"
  end
  
  canvas :id => "canvas", :height => "130" do
    the_prop :text => "I am named the_prop - note how I get both styles."
  end

  __install "documentation/common/styles_sandbox.rb"
end

slide do
  heading :text => "Style Cascading"
  
  directions :text => "Styles in Limelight do not cascade to nested props like you might expect if you are familiar with CSS.  However since a nested prop is contained within its parent it can share some of its appearance.  See this example for details:"
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  text_color :blue"
    code :text => "  background_color :white"
    code :text => "}"    
    code :text => "prop1 {"
    code :text => "  border_color :black"
    code :text => "}"
  end
  
  canvas :id => "canvas", :height => "130" do
    prop do
      prop1 :border_color => :black, :border_width => 2, :margin_width => 3, :text => "Prop 1 is nested in Prop2. It does not get the blue text_color attribute but will have its background_color because it is contained entirely in its parent prop."
    end
  end
  
  __install "documentation/common/styles_sandbox.rb"
end

slide do
  heading :text => "Styles Attribute"
  
  directions :text => "Sometimes you don't want to match the name of the style to the name of the prop, for example when you want to style one of the built-in props.  In this situation there is a simple syntax for specifying the style name:"
  
  codeblock do
    code :text => "prop_using_styles_attribute :styles => 'stylename', :text => 'I am text'"
  end
  
  directions :text => "You can also put multiple style names in the styles attribute.  The styles will be applied in order from left to right, and in the case of a duplicate style attribute the rightmost style takes precedence."
  
end


slide do
  heading :text => "Production Style File"
  directions :text => "As mentioned earlier each Scene can have its own style file.  In addition there is an optional Production styles file, named styles.rb, that lives alongside stages.rb and production.rb.  The styles are applied in the following order:"
  
  list do
    list_item :text => "1) Apply any styles in the production style file."
    list_item :text => "2) Apply any styles in the scene styles.rb."
    list_item :text => "3) Apply the styles in the styles attribute of the prop."
    list_item :text => "4) Apply any styles attached directly to the prop."
  end
  
  directions :text => "In the case of duplicate style attributes the last attribute to be applied wins.  So if a Production style sets the text_color to :black but the Scene style sets it to :blue, then the text color will be blue."
end

slide do
  heading :text => "Finished"
  
  directions :text => "You now know enough to start creating your own styles in Limelight.  If you proceed through the next tutorial you'll start learning the details of those very styles."
end
