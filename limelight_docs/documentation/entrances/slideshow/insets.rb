slide do
  heading :text => "Margins and Padding"
  directions :text => "Like HTML elements Props can have margins and padding.  As Limelight does not have to deal with multiple browsers these behave in a consistent and reliable fashion, where the margin is always outside the border and the padding is always inside.  Let's go through a few of the ways to use them."
end

slide do
  heading :text => "Margin"
  directions :text => "Like the margin on a piece of paper the margin of a Prop is outside its border.  This makes it good for pushing a Prop away from other Props.  Specifying the margin with the margin style will apply it uniformly around the Prop.  You can also specify top, bottom, left and right margins individually.  This is true for all of these attributes.  Let's move the Prop with the border to the right and down, to give its neighbor some space.  Note that the values are relative to its parent Prop."
  
  sandbox_codeblock do
    code :text => "right_prop {"
    code :text => "  left_margin 10"
    code :text => "  top_margin 30" 
    code :text => "}"
  end
  
  __install "documentation/common/styles_sandbox.rb", :prop_file => "documentation/entrances/inset_examples/left_top_margin.rb", :height => 120
end

slide do
  heading :text => "Percentage"
  directions :text => "Margins, as well as padding, can be specified as a percentage of their parent space.  If a Prop grows in size, its margin will grow proportionally, as opposed to remaining a fixed width.  Note how when we grow the parent box here the child box is affected by it.  The child box has a 5% margin."
  
  sandbox_codeblock do
    code :text => "box_with_child_with_margin {"
    code :text => "  height 90"
    code :text => "  width 200"
    code :text => "}"
  end
  
  __install "documentation/common/styles_sandbox.rb", :prop_file => "documentation/entrances/inset_examples/percentage_margin.rb", :height => 160
end

slide do
  heading :text => "Padding"
  directions :text => "Naturally, padding works within the Prop's own area.  The box below has no padding, and you can see the text is pretty cramped.  Give it some padding so it can relax."

  sandbox_codeblock do
    code :text => "cramped_text {"
    code :text => "  padding 20"
    code :text => "}"
  end
  
  __install "documentation/common/styles_sandbox.rb", :prop => "cramped_text :text => 'A little room please!', :border_width => 1, :border_color => :black"
end

slide do
  heading :text => "In Combination"
  directions :text => "Padding and margin work well in combination with each other.  Margin is best for moving props away from or closer to each other, whereas padding is well suited for manipulating child props within their parent.  This scene has three props, where the left prop has no children and the right prop has a child in it.  Look at how you can manipulate the scene through margin and padding."
  
  sandbox_codeblock do
    code :text => "left_prop {"
    code :text => "  margin 20"
    code :text => "}"
    code :text => "inner_prop {"
    code :text => "  padding 20"
    code :text => "}"
  end
  
  __install "documentation/common/styles_sandbox.rb", :prop_file => "documentation/entrances/inset_examples/combination.rb", :height => 130, :text_area_height => 200
end

slide do
  heading :text => "Summary"
  directions :text => "In summary, the margins and padding can be applied either in total or independently.  Notice how the naming convention is backwards from CSS, i.e. left_padding not padding-left.  All the options can take pixes or percentage."
  
  line_break
  directions :text => "Padding Options"
  codeblock do
    code :text => "padding, top_padding, bottom_padding, left_padding, right_padding"
  end
  
  directions :text => "Margi Options"
  codeblock do
    code :text => "margin, margin_padding, margin_padding, margin_padding, margin_padding"
  end
  
end

__install "documentation/common/finished_slide.rb"