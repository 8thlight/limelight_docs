slide do
  directions :text => "At some point you may want do more than just edit existing props on the scene, whether it be adding new props or removing existing props entirely.  This tutorial will teach you how to do these things."
end

slide do
  heading :text => "Build"
  directions :text => "First let's look at adding props.  All Props have access to the build method which takes a block as its parameter.  Inside this block you can add Props to the scene using the same DSL as you would in a Props file."
  line_break
  directions :text => "In this example, clicking the text will add a new label to the scene with the text of \"Stop Clicking Me!\""
  sandbox_codeblock do
    code :text => "def mouse_clicked(event)"
    code :text => "  scene.find('red_prop').build do"
    code :text => "    wide_label :text => 'Stop Clicking Me!'"
    code :text => "  end"
    code :text => "end"
  end

  __install "#{Dir.pwd}/production/documentation/common/players_sandbox.rb", :prop => 'prop_to_extend(:id => "red_prop") do wide_label :text => "Click Me!", :text_color => :red end', :text_area_height => 200
end

slide do
  heading :text => "Build with Options"
  directions :text => "Sometimes you may want to add props to the scene with variable data.  You can do this by passing a hash of variables into the build method.  Passed in values will appear as instance variables in the props DSL."
  line_break
  directions :text => "In this example, we have a text_area with the id of \"my_text\" and a Prop with the id of \"label_list\".  When you click the button, whatever text you have entered in \"my_text\" will be added as a new Prop in the list."
  sandbox_codeblock do
    code :text => "def mouse_clicked(event)"
    code :text => "  my_text = scene.find('my_text').text"
    code :text => "  scene.find('label_list').build(:text => my_text) do"
    code :text => "    wide_label :text => @text"
    code :text => "  end"
    code :text => "end"
  end

  __install "#{Dir.pwd}/production/documentation/common/players_sandbox.rb", :prop => "group(:id => 'label_list', :width => '100%') do text_area_prop(:players => 'text_area', :id => 'my_text', :height => 25); prop_to_extend(:players => 'button', :text => 'Add to List'); end", :text_area_height => 200
end

slide do
  heading :text => "Install"
  directions :text => "Sometimes, you may find yourself with a very large, ugly build block, or you may find yourself duplicating the same build block across multiple Players.  One way to remove this duplication/complexity is through the __install command."
  line_break
  directions :text => "You can install Prop Partials inside the build block using the exact same method as you already learned in the \"Prop Partials\" tutorial.  In this example, \"partial_four\" contains a wide_label with the text of \"Good Job!\""
  
  sandbox_codeblock do
    code :text => "def mouse_clicked(event)"
    code :text => "  scene.find('my_list').build do"
    code :text => "    __install 'sandbox_toys/partial_four.rb'"
    code :text => "  end"
    code :text => "end"
  end

  __install "documentation/common/players_sandbox.rb", :prop => 'prop_to_extend(:id => "my_list") do wide_label :text => "Click Me!" end', :text_area_height => 200
end

slide do
  heading :text => "Remove"
  directions :text => "Up to this point, we have only been editing and adding Props to the Scene.  The next logical step would be to remove them."
  line_break
  directions :text => "Removing Props is really easy.  You simply call the remove method passing in the Prop you want to remove from the scene.  The Prop that is being removed must be a direct descendent of the Prop on which you call remove."

  sandbox_codeblock do
    code :text => "def mouse_clicked(event)"
    code :text => "  scene.find('my_list').remove(self)"
    code :text => "end"
  end
  
  __install "#{Dir.pwd}/production/documentation/common/players_sandbox.rb", :prop => 'list(:id => "my_list") do; prop_to_extend :text => "Click Me 1!", :width => "100%";prop_to_extend :text => "Click Me 2!", :width => "100%";prop_to_extend :text => "Click Me 3!", :width => "100%";prop_to_extend :text => "Click Me 4!", :width => "100%";prop_to_extend :text => "Click Me 5!", :width => "100%"; end', :text_area_height => 100
  
end

slide do
  heading :text => "Remove All"
  directions :text => "The remove_all command is a good way to remove many Props from the Scene at the same time.  Calling remove_all on a Prop removes all children of that Prop from the Scene."
  line_break
  directions :text => "In this example, the Prop wrapping all the labels is the Prop that will have the following behavior."
  sandbox_codeblock do
    code :text => "def mouse_clicked(event)"
    code :text => "  self.remove_all"
    code :text => "end"
  end
  
  __install "#{Dir.pwd}/production/documentation/common/players_sandbox.rb", :prop => 'prop_to_extend(:id => "my_list") do; wide_label :text => "Click Me!";wide_label :text => "Click Me!";wide_label :text => "Click Me!";wide_label :text => "Click Me!";wide_label :text => "Click Me!"; end', :text_area_height => 100
  
end

__install "#{Dir.pwd}/production/documentation/common/finished_slide.rb"
