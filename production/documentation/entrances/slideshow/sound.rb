slide do
  directions :text => "Eventually you may want to play some sounds in Limelight."
  line_break
  directions :text => "This tutorial will explain how to add sounds to a Production."
end

slide do
  heading :text => "Playing a Sound"
  directions :text => "In order to play a sound, merely call the play_sound method and pass in the location of the file you want to be played.  The file loaction is relative to the Production root."
  line_break
  directions :text => "Files must be in the .au file format."
  line_break
  directions :text => "Provided for this sample are bird.au, cat.au, cow.au, dog.au, donkey.au and duck.au.  Try it out by clicking on the prop below."
  sandbox_codeblock do
    code :text => "label :text => 'Dog', :on_mouse_clicked => \"play_sound('sandbox_toys/sounds/dog.au')\""
  end

  __install "#{Dir.pwd}/production/documentation/common/prop_sandbox.rb", :height => "130"
end

__install "#{Dir.pwd}/production/documentation/common/finished_slide.rb"
