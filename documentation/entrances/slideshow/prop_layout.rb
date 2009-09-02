slide do
  heading :text => "Prop Layout"
  directions :text => "Limelight's layout system moves from left to right, then top to bottom.  If a prop reaches the end of the space it moves to down to the next available row.  These simple rules can produce almost any interface you want.  Let's go through some examples."
end

slide do
  heading :text => "1. Basic Layout"
  directions :text => "Here we have some props that will run in a row.  Eventually they will reach the end of their parent prop, then move to the next row.  See for yourself with this example."
  
  sandbox_codeblock do
    code :text => "sample :width => 100, :height => 40, :background_color => \"red\""
    code :text => "sample :width => 100, :height => 40, :background_color => \"orange\""
    code :text => "sample :width => 100, :height => 40, :background_color => \"yellow\""
    code :text => "sample :width => 100, :height => 40, :background_color => \"blue\""
    code :text => "sample :width => 100, :height => 40, :background_color => \"green\""
  end

  __install "documentation/common/sandbox.rb", {:height => 150}
end

slide do
  heading :text => "2. Variable Height"
  directions :text => "That's a great simple case - but what happens when the props are of variable height?  Where can we expect them to go?  Let's see two different examples.  What happens when the first prop in a row is taller than all the rest?"
  
  sandbox_codeblock do
    code :text => "sample :width => 200, :height => 40, :background_color => \"red\""
    code :text => "sample :width => 200, :height => 20, :background_color => \"green\""
    code :text => "sample :width => 200, :height => 20, :background_color => \"blue\""
    code :text => "sample :width => 200, :height => 20, :background_color => \"orange\""  
  end
  
  __install "documentation/common/sandbox.rb", {:height => 160}
end

slide do
  heading :text => "3. Variable Height - Part 2"
  directions :text => "So you see how the largest prop set the height of the row.  What happens if it is in the middle of the row, instead of at the front."
  
  sandbox_codeblock do
    code :text => "sample :width => 200, :height => 20, :background_color => \"red\""
    code :text => "sample :width => 200, :height => 40, :background_color => \"green\""
    code :text => "sample :width => 200, :height => 20, :background_color => \"blue\""
    code :text => "sample :width => 200, :height => 20, :background_color => \"orange\""  
  end
  
  __install "documentation/common/sandbox.rb", {:height => 180}
end

slide do
  heading :text => "4. No Cutting"
  
  directions :text => "If a prop cannot fit on a given row it will always appear on the next row, without being cut in half or shrunk to fit."
  
  sandbox_codeblock do
    code :text => "sample :width => 15, :height => 20, :background_color => \"red\""
    code :text => "sample :width => 450, :height => 40, :background_color => \"green\""
  end
  
  __install "documentation/common/sandbox.rb"
end

slide do
  heading :text => "5. Finished"
  
  directions :text => "That's all there is to it.  With the basics of layout understood you should be able to begin creating more complex scenes in Limelight.  Move on to the next tutorial."
end