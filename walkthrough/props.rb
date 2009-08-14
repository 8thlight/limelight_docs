previous_button :id => "previous"
logo
next_button :id => "next"
slideshow :id => "slideshow" do
  step do
    directions :text => "So you've seen Limelight and now you want to develop in it.  You're one of the cool kids.  Now let's get you started. Click the Next button to proceed."
  end
  
  step do
    directions :text => "The first thing you'll need to install is JRuby.  Head to the JRuby website and follow the instructions there, then click Next."
  end
  
  step do
    directions :text => "Better check that you did that right.  It's not that we don't trust you, it's just that we don't trust you.  Click Verify."
    verify_button
  end
end