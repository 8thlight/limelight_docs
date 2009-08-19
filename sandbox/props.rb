canvas :id => "directions", :height => "200", :vertical_scrollbar => :on do
  directions_text :text => "Props are the fundamental building blocks of a Scene. They form a tree structure where one Prop may contain other Props. In fact, the Scene is itself a Prop that is the root of all Props within it.\n"
  directions_text :text => ""
  
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
    code :text => "prop :id => 'parent', :border_color => 'red', :border_width => '1' do"
    code :text => "  prop :id => 'child', :border_color => 'blue', :border_width => '1',"
    code :text => "                       :margin => '3', :text => 'I am a child'"
    code :text => "end"
  end
end

canvas :id => "canvas", :width => "100%", :height => "200", :top_margin => "15", :bottom_margin => "15" do
  prop :text => "Your props will appear here"
end

text_area :id => "code", :width => "95%", :margin => "2%"
sandbox_button :players => "button", :text => "Illuminate"