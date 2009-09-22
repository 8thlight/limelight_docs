slide do
  heading :text => "Installing"
  directions :text => "Through the use of prop partials, one can remove duplication in the props.rb files. To use a prop partial, simply use the __install command.  Here is the partial:"

  codeblock do
    code :text => "example_partial do"
    code :text => "  label :text => 'Good Job!'"
    code :text => "end"
  end
  line_break
  directions :text => "Here is the code used to install the partial:"
  sandbox_codeblock do
    code :text => "__install 'example_partials/sample_one.rb'"
  end

  __install "documentation/common/prop_sandbox.rb", :height => "140"
end

slide do
  heading :text => "Instance Variable"
  directions :text => "When loading a prop partial, you can also pass in instance variables.  Let's try that out now.  Here is the partial again:"
  
  codeblock do
    code :text => "example_partial do"
    code :text => "  label :text => @text"
    code :text => "end"
  end
  line_break
  directions :text => "Again, here is the code used to install the partial.  We just pass a hash of values that get set to instance variables in the partial:"
  sandbox_codeblock do
    code :text => "__install 'example_partials/sample_two.rb', :text => 'Change me!'"
  end

  __install "documentation/common/prop_sandbox.rb", :height => "140"
end