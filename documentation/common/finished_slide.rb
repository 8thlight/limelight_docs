slide do
  next_walkthrough = WalkthroughLink.next(@slideshow)
  heading :text => "Finished"
  if next_walkthrough
    directions :text => "Congratulations!  You completed this tutorial.  Feel free to play and experiment with it and when you're ready, head to the"
    toc_link :id => "next_slideshow", :slideshow => next_walkthrough.slideshow, :title => next_walkthrough.title, :text => "next tutorial."
  else
    directions :text => "Congratulations!  You completed the last tutorial.  Feel free to play and experiment with it and when you're ready, start your own Limelight Production."
  end
end