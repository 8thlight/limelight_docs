previous_button :id => "previous"
logo
next_button :id => "next"
slideshow :id => "slideshow" do
  
  slide do
    directions :text => "So you've seen Limelight and now you want to develop in it.  You're one of the cool kids.  Now let's get you started."
    link :text => "I am a test", :url => "http://www.google.com"
    directions_specific :text => "To follow this tutorial simply click the next button in the top right corner and follow the directions on each page.  Some pages will have slides to verify that your system is setup properly, so make sure you follow all of the direcitons."
  end
  
  slide do
    directions :text => "The first thing you'll need to install is JRuby.  Head to the JRuby website and follow the instructions there, then click Next."
  end
  
  slide do
    directions :text => "Better check that you did that right.  It's not that we don't trust you, it's just that we don't trust you.  Click Verify."
    verify_button
  end
  
end