slide do
  line_break
  directions :text => "All the worlds a stage and .... you get the drill.  Right now your Props may look pretty, but they can't do anything.  To add behavior to a Prop you create a Player, which is just a Ruby module that contains the Prop's behavior.  Let's dive into that right now."
end

slide do
  heading :text => "Who are the Players?"
  directions :text => "To link a Prop to a Player, you create a module with the same name as that Prop only capitalized.  For example this very application has a Player named NextButton that looks like this:"
    
  codeblock do
    code :text => "module NextButton"
    code :text => "  def mouse_clicked(event)"
    code :text => "    scene.find(\"slideshow\").next"
    code :text => "  end"
    code :text => "end"
  end
  
  line_break
  directions :text => "Now any Prop named next_button has this behavior, in this case advancing the slideshow."
  line_break
  codeblock do
    code :text => "next_button :text => 'Next'"
  end
end

slide do
  heading :text => "Player File"
  directions :text => "Each Scene has a \"players\" directory, which contains a Ruby module for each Player in that scene.  When the Scene is loaded it will attach the the Players to the Props in the Scene."
  line_break
  directions :text => "In addition there can be Production level Players.  Those are created by creating a players directory in the root directory of the Production and putting Players in it.  Production level Players will be available to all Scenes in the Production."
  line_break
  images :width => "100%", :horizontal_alignment => :center, :top_padding => 10 do
    screenshot :image => "images/players.jpg", :players => "image"
  end
end

slide do
  heading :text => "Players Attribute"
  directions :text => "Sometimes its inappropriate to name the Prop and the Player the same thing, or perhaps you want to mix-in more than one Player.  This can be done through the players attribute which is used just like the styles attribute.  In the example below you we define this_prop with the Props DSL and assign it the Players NextButton and HighlightedButton."
  
  codeblock do
    code :text => "this_prop :players => 'NextButton, HighlightedButton', :text => 'I am text'"
  end
end

__install "#{Dir.pwd}/production/documentation/common/finished_slide.rb"
