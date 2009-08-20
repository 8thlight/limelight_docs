canvas :id => "directions", :height => "290", :vertical_scrollbar => :on do
  directions_text :text => "Props are the fundamental building blocks of a Scene. They form a tree structure where one Prop may contain other Props. In fact, the Scene is itself a Prop that is the root of all Props within it.\n"
  directions_text :text => "The syntax to define Props is as simple as possible. Limelight provides a DSL, or simple syntax, for building Props."
  
  directions :text => "To create a new prop:"
  codeblock do
    code :text => "prop :text => 'show me! '"
  end
  
  directions :text => "To create a nested prop:"
  codeblock do
    code :text => "prop :id => 'parent' do"
    code :text => "  prop :id => 'child', :text => 'I am a child'"
    code :text => "end"
  end
  
  directions :text => "Setting styles on a prop:"
  codeblock do
    code :text => "prop :width => '100', :height => '100', :border_color => 'red', :border_width => '1', :text => 'With some bad style'"
  end
end

canvas :id => "canvas", :width => "100%", :height => "200", :top_margin => "15", :bottom_margin => "15" do
  prop :text => "Your props will appear here"
end

text_area :id => "code", :width => "95%", :margin => "2%"
sandbox_button :players => "button", :text => "Illuminate", :id => "sandbox_button"