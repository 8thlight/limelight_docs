slide do
  directions :text => "Eventually you may want to play some sounds in limelight"
  line_break
  directions :text => "This tutorial will explain how to add sounds to a prop"
end

slide do
  heading :text => "Playing a Sound"
  directions :text => "In order to play a sound when you click a prop, merely call the play_sound method passing in the location of the file you want to be played.  The file loaction is relative to the project root."
  line_break
  directions :text => "Files must be in the au file format."
  line_break
  directions :text => "Provided for this sample are bird.au, cat.au, cow.au, dog.au, donkey.au and duck.au"
  sandbox_codeblock do
    code :text => "label :text => 'Dog', :on_mouse_clicked => \"play_sound('sandbox_toys/sounds/dog.au')\""
  end

  __install "documentation/common/prop_sandbox.rb", :height => "130"
end

slide do
  heading :text => "Finished"
  directions :text => "And that's it for sounds.  Time to head on to the next tutorial."
end