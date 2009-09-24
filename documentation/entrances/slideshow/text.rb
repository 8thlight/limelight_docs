slide do
  directions :text => "For almost every Limelight production you will need to display text on the screen.  Luckily, Limelight makes it really easy."
  line_break
  directions :text => "You've already seen how to add text to a prop, but this tutorial also explains all the ways you can style text."
end

slide do
  heading :text => "Adding Text"
  directions :text => "Here's another simple example.  To add text to a prop, simply set the text style attribute."

  sandbox_codeblock do
    code :text => "label :text => 'Good Job'"
  end

  __install "documentation/common/prop_sandbox.rb"
end

slide do
  heading :text => "Font Size"
  directions :text => "Now that was pretty boring.  Let's try something a little more compliated, like changing the font size.  Let's make it bigger!"
  line_break
  line_break
  sandbox_codeblock do
    code :text => "label :text => 'Good Job', :font_size => 72"
  end

  __install "documentation/common/prop_sandbox.rb"
end

slide do
  heading :text => "Text Color"
  directions :text => "Let's try changing the text's color.  Use the text_color style attribute.  Color's can be symbols or hex values (like #FFFFFF)."
  line_break
  directions :text => "The prop big_label has some default styling already provided."

  sandbox_codeblock do
    code :text => "big_label :text => 'Good Job', :text_color => :red"
  end

  __install "documentation/common/prop_sandbox.rb"
end

slide do
  heading :text => "Font Face"
  directions :text => "You can also specify the font face of the text using the font_face attribute.  The value must be a recognized system font."
  
  sandbox_codeblock do
    code :text => "big_label :text => 'Good Job', :font_face => 'Arial'"
    code :text => "big_label :text => 'Good Job', :font_face => 'Times'"
  end

  __install "documentation/common/prop_sandbox.rb"
end

slide do
  heading :text => "Font Style"
  directions :text => "The last part of text styling is the font_style attribute."
  line_break
  directions :text => "Possible Values are: \"plain\", \"bold\", \"italic\" and \"bold italic\""

  sandbox_codeblock do
    code :text => "big_label :text => 'Good Job', :font_style => 'bold italic'"
  end

  __install "documentation/common/prop_sandbox.rb"
end

slide do
  heading :text => "Combining Styles"
  directions :text => "Here we see all the possible styles being used together."
  sandbox_codeblock do
    code :text => "label :text => 'Good Job',"
    code :text => "      :font_size => 72,"
    code :text => "      :text_color => :red,"
    code :text => "      :font_face => 'Arial',"
    code :text => "      :font_style => 'bold italic'"
  end

  __install "documentation/common/prop_sandbox.rb"
end

__install "documentation/common/finished_slide.rb"