slide do
  heading :text => "Prop Sizing"
  directions :text => "Props will come in variable sizes.  Props have a height and width, which can be sized in pixels or in percentages, or left unspecified in which case automatic sizing will be used."
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
  directions :text => "Props are also sized based on a percentage of their containing prop.  This scene has two props, one within another.  Sizing one to 50% of the other will shrink it to half its parent's size."

  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  height '50%'"
    code :text => "  width '50%'"
    code :text => "}"
  end
  
  canvas :id => "canvas" do
    containing_prop :styles => "prop_to_style", :border_width => 1, :border_color => :black do
      prop :styles => "prop_to_style", :border_width => 1, :border_color => :blue
    end
  end
  
  __install "documentation/common/styles_sandbox.rb"
end

slide do
  heading :text => "3. Auto Size"
  directions :text => "In addition to explicitly sizing props, props can be automatically sized relative to their content.  In this example there are two props, a parent and a child where the parent has a black border and the child has a blue border.  Both have their height and width set to 'auto' which can be done in a style or by not setting the size at all.  When the child prop is sized it the parent prop will expand to fit the child."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  height 70"
    code :text => "  width 70"
    code :text => "}"
  end
  
  canvas :id => "canvas", :height => 150 do
    containing_prop :border_width => 1, :border_color => :black do
      prop :border_width => 1, :border_color => :blue, :margin => 3
    end
  end
  
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
  
  canvas :id => "canvas" do
    containing_prop :border_width => 1, :border_color => :black do
      prop :styles => "tiny_prop", :text => "The parent and child are set to auto, and have adjusted to fit this text."
    end
  end
  
  __install "documentation/common/styles_sandbox.rb"
end

slide do
  heading :text => "5. Containing Props"
  directions :text => "If a prop is contained within a prop that has an explicit size it will not grow that containing block beyond its size.  That's true even if the child prop has explicitly large settings for the size.  If the parent prop is auto, then it is constrained by its parent, and so on.  If all the props on the scene were set to auto they would be constrained by the root prop, the scene itself."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  height 1000"
    code :text => "  width 1000"
    code :text => "}"
  end
  
  canvas :id => "canvas", :height => 150 do
    containing_prop :border_width => 1, :border_color => :black do
      prop :styles => "tiny_prop", :text => "I will not make my parent props grow."
    end
  end
  
  __install "documentation/common/styles_sandbox.rb"
end


slide do
  heading :text => "6. Finished"
  directions :text => "Great!  You can make all kinds of sizes of props.  Play some more then move on to the next tutorial."
end