slide do
  directions :text => "Floating props is useful when you don't want a prop to interfere with other props on the screen.  It allows you to shift the prop around within its parent prop."
  line_break
  directions :text => "By default, the float style attribute on a Prop is set to off.  If you set float to on, the rest of the props will be placed on the screen as if the floating prop was not there.  Then the floating prop will be placed on top of the rest of the props."
end

slide do
  heading :text => "Simple Example"
  directions :text => "Once you set float to :on, you can then use the x and y style attributes to move the prop around.  x and y can takes values representing a number of pixels or a percentage of the size of the parent prop."
  line_break
  directions :text => "One thing to note is that the x and y attributes do nothing if float is off."
  sandbox_codeblock do
    code :text => "label :text => 'Move Me', :float => :on, :x => 50, :y => '40%'"
    code :text => "label :text => 'I do not float'"
    code :text => "image_prop :players => 'image', :image => 'images/homer_small.jpg'"
  end

  __install "documentation/common/prop_sandbox.rb", :height => "140"
end

slide do
  heading :text => "Floating Multiple Props"
  directions :text => "If multiple props have float on, the last prop placed will appear on the top.  Try swapping these two props."
  sandbox_codeblock do
    code :text => "image_prop :players => 'image', :image => 'images/homer_small.jpg', :float => :on, :x => 50, :y => '50%'"
    code :text => "label :text => 'Top Prop', :float => :on, :x => 50, :y => '50%'"
  end
  __install "documentation/common/prop_sandbox.rb"
end

slide do
  heading :text => "Finished"
  directions :text => "Now you know how to float props.  It's time to move on to the next tutorial."
end