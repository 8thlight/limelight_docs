slide do
  heading :text => "Styles"
  directions :text => "Up until now you've been adding styles directly to the props.  While this is nice for experimentation, it's not a great way to organize real production code.  Let's take a tour of the styles DSL, the preferred way of setting up styles in Limelight.  "
  line_break
  directions :text => "Along the way we'll show you a few of the styles you haven't seen yet, demonstrating the power of this fully armed and operational rich client framework."
end

slide do
  heading :text => "1.  The Styles File"
  directions :text => "You may recall from the Getting Started tutorial that each scene has a props.rb. which defines all it's props.  Alongside that file you can also create a styles.rb file.  In order to apply a style to a prop we simply give the style the same name as the prop being styled.  The syntax looks like this:"
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
  heading :text => "2. A basic style"
  directions :text => "The scene below you has one prop in it, interestingly named prop.  Currently it has no style, but you can help it out.  In the text area below enter the following:"
  
  codeblock do
    code :text => "prop {"
    code :text => "  text_color :blue"
    code :text => "}"
  end
  
  canvas :id => "canvas" do
    prop :text => "Turn Me Blue!", :id => "test_prop"
  end

  text_area :id => "code", :width => "95%", :margin => "2%"
  run_styles_button :players => "button", :text => "Run", :id => "run_styles_button"
end

slide do
  heading :text => "3.  Text Attributes"
end