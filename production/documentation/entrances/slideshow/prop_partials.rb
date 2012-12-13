slide do
  directions :text => "Want to remove duplication from your Props files? Need to make them easier to read?"
  line_break
  directions :text => "This can be done through the use of Prop Partials.  A Partial is just a separate file containing a hierarchy of Props.  You can include this Partial with just one line in a different Props file."
end

slide do
  heading :text => "Installing"
  directions :text => "Using Prop Partials is really simple.  To use a Prop Partial, simply use the __install command.  Here is the Partial I've created for you:"

  codeblock do
    code :text => "example_partial do"
    code :text => "  label :text => 'Good Job!'"
    code :text => "end"
  end
  line_break
  directions :text => "Try using the Partial with the following syntax.  Note that the file path is relative to the Production root."
  sandbox_codeblock do
    code :text => "__install 'sandbox_toys/partial_one.rb'"
  end

  __install "documentation/common/prop_sandbox.rb", :height => "130"
end

slide do
  heading :text => "Instance Variables"
  directions :text => "When loading a Prop Partial, you can also pass in instance variables.  Let's try that out now.  Here is the already created Partial:"
  
  codeblock do
    code :text => "example_partial do"
    code :text => "  label :text => @text"
    code :text => "end"
  end
  line_break
  directions :text => "Here is the code used to install the Partial.  We just pass a hash of values that get set to instance variables in the Partial:"
  sandbox_codeblock do
    code :text => "__install 'sandbox_toys/partial_two.rb', :text => 'Change me!'"
  end

  __install "documentation/common/prop_sandbox.rb", :height => "140"
end

slide do
  heading :text => "Nested Partials"
  directions :text => "When installing Partials, you can have a partial install a partial, and install one at any point in the Props hierarchy."
  
  codeblock do
    code :text => "example_partial do"
    code :text => "  label :text => 'This is outside the border'"
    code :text => "  nested_prop(:border_width => 1) do"
    code :text => "    __install 'sandbox_toys/partial_one.rb'"
    code :text => "  end"
    code :text => "end"
  end
  
  directions :text => "This code installs the above partial."
  sandbox_codeblock do
    code :text => "__install 'sandbox_toys/partial_three.rb', :text => 'Change me!'"
  end

  __install "documentation/common/prop_sandbox.rb", :height => "130"
end

__install "documentation/common/finished_slide.rb"