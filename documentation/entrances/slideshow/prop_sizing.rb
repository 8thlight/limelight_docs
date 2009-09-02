slide do
  heading :text => "Prop Sizing"
  directions :text => "Props have a height and width which can be sized in pixels, percentages, or left unspecified in which case automatic sizing will be used."
end

slide do
  heading :text => "1. Pixels"
  directions :text => "The simplest way to size a prop is to just set a pixel height and a pixel width."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  height 100"
    code :text => "  width 100"
    code :text => "}"
  end
  
  __install "documentation/common/canvas_with_box.rb", :prop_options => {:border_width => 1, :border_color => :black}  
  __install "documentation/common/styles_sandbox.rb"
end

slide do
  heading :text => "2. Percentage"
  directions :text => "Props are also sized based on a percentage of their containing prop.  This scene has two props where the child prop is named prop and has a blue border.  Sizing it to 50% of the other will shrink it to half its parent's size."

  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  height '50%'"
    code :text => "  width '50%'"
    code :text => "}"
  end
  
  __install "documentation/common/canvas_with_props.rb", {:props => "documentation/entrances/prop_sizing_examples/percentage_sizing.rb"}
  __install "documentation/common/styles_sandbox.rb"
end

slide do
  heading :text => "3. Auto Size"
  directions :text => "In addition to explicitly sizing props, props can be automatically sized relative to their content.  In this example there are two props, a parent and a child where the parent has a black border and the child has a blue border.  Both have their height and width set to 'auto' which can be done in a style or by not setting the size at all.  When the child prop is sized the parent prop will expand to fit the child."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  height 70"
    code :text => "  width 70"
    code :text => "}"
  end
  
  __install "documentation/common/canvas_with_props.rb", {:height => 150, :props => "documentation/entrances/prop_sizing_examples/auto_size.rb"}
  __install "documentation/common/styles_sandbox.rb"
end

slide do
  heading :text => "4. Auto Size Text"
  directions :text => "When size is set to auto the prop expands to fit a text block inside it.  Set the sizes to auto in order to see the text."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  height 'auto'"
    code :text => "  width 'auto'"
    code :text => "}"
  end
  
  __install "documentation/common/canvas_with_props.rb", {:height => 150, :props => "documentation/entrances/prop_sizing_examples/auto_size_with_text.rb"}  
  __install "documentation/common/styles_sandbox.rb"
end

slide do
  heading :text => "5. Constraining Props"
  directions :text => "The size of a prop is constrained by the size of its parent.  That means if the parent is sized to auto, the children can grow the prop to fit.  If the prop is sized by pixels or percentage, then that value is fixed and the child props cannot make their parents grow.  Look what happens when a child prop is very large."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  height 1000"
    code :text => "  width 1000"
    code :text => "}"
  end
  
  canvas :id => "canvas", :height => 150 do
    containing_prop :border_width => 1, :border_color => :black do
      prop :text => "I will not make my parent props grow."
    end
  end
  
  __install "documentation/common/styles_sandbox.rb"
end


slide do
  heading :text => "6. Finished"
  directions :text => "Great!  You can make all kinds of sizes of props.  Play some more then move on to the next tutorial."
end