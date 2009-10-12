slide do
  directions :text => "At some point you may want do more than just edit existing props on the scene, whether it be adding new props or removing existing props entirely.  This tutorial will teach you how to do these things."
end

slide do
  heading :text => "Build"
  directions :text => "First let's look at adding props.  All Props have access to the build method which takes a block as its parameter.  Inside this block you can add Props to the scene using the same syntax as you would in a Props file."
  line_break
  directions :text => "In this example, clicking the text will add a new label to the scene with the text of \"Stop Clicking Me!\""
  sandbox_codeblock do
    code :text => "def mouse_clicked(event)"
    code :text => "  scene.find('red_prop').build do"
    code :text => "    label :text => 'Stop Clicking Me!'"
    code :text => "  end"
    code :text => "end"
  end

  __install "documentation/common/players_sandbox.rb", :prop => 'prop_to_extend(:id => "red_prop") do label :text => "Click Me!", :text_color => :red end'
end

slide do
  heading :text => "Build with Options"
  directions :text => "Sometimes you may want to add props to the scene with variable data.  You can do this by passing a has of options into the build method.  Passed in values will appear as instance variables in the props syntax."
  line_break
  directions :text => "In this example, we have a text_area with the id of \"my_text\" and a prop with the id of \"label_list\".  When you click the button, whatever text you have entered in \"my_text\" will be added as a new prop in the list."
  sandbox_codeblock do
    code :text => "def mouse_clicked(event)"
    code :text => "  my_text = scene.find('my_text').text"
    code :text => "  scene.find('label_list').build(:text => my_text) do"
    code :text => "    label :text => @text"
    code :text => "  end"
    code :text => "end"
  end

  __install "documentation/common/players_sandbox.rb", :prop => "group(:id => 'label_list') do text_area_prop(:players => 'text_area', :id => 'my_text', :height => 25); prop_to_extend(:players => 'button', :text => 'Add to List'); end"
end

slide do
  heading :text => "Install"
  directions :text => "Sometimes, you may need to add a large amount of props to a scene at once or the same props from multiple players.  One way to simplify this is through the install command."
  line_break
  directions :text => "You can install Prop Partials inside the build block just as you can inside a regular Props file.  In this example, \"partial_one\" contains a label with the text of \"Good Job!\""
  
  sandbox_codeblock do
    code :text => "def mouse_clicked(event)"
    code :text => "  scene.find('my_list').build do"
    code :text => "    __install 'sandbox_toys/partial_one.rb'"
    code :text => "  end"
    code :text => "end"
  end

  __install "documentation/common/players_sandbox.rb", :prop => 'prop_to_extend(:id => "my_list") do label :text => "Click Me!" end'
end

slide do
  heading :text => "Remove"
  directions :text => "Up to this point, we have only been editing and adding Props to the Scene.  The next logical step would be to remove them."
  line_break
  directions :text => "Removing Props is really easy.  You simple call the remove method passing in the Prop you want to remove from the scene.  The Prop that is being removed must be a child of the Prop you call remove on."

  sandbox_codeblock do
    code :text => "def mouse_clicked(event)"
    code :text => "  scene.find('my_list').remove(self)"
    code :text => "end"
  end
  
  __install "documentation/common/players_sandbox.rb", :prop => 'list(:id => "my_list") do; prop_to_extend :text => "Click Me 1!", :width => "100%";prop_to_extend :text => "Click Me 2!", :width => "100%";prop_to_extend :text => "Click Me 3!", :width => "100%";prop_to_extend :text => "Click Me 4!", :width => "100%";prop_to_extend :text => "Click Me 5!", :width => "100%"; end'
  
end

slide do
  heading :text => "Remove All"
  directions :text => "The remove_all command is a good way to remove many Props from the Scene at the same time.  Calling remove all on a Prop removes all children of that Prop from the Scene."
  line_break
  directions :text => "In this example, the Prop wrapping all the labels is the Prop that will have the following behavior."
  sandbox_codeblock do
    code :text => "def mouse_clicked(event)"
    code :text => "  self.remove_all"
    code :text => "end"
  end
  
  __install "documentation/common/players_sandbox.rb", :prop => 'prop_to_extend(:id => "my_list") do; label :text => "Click Me!";label :text => "Click Me!";label :text => "Click Me!";label :text => "Click Me!";label :text => "Click Me!"; end'
  
end

__install "documentation/common/finished_slide.rb"