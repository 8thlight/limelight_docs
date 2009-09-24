slide do
  next_walkthrough = WalkthroughLink.next(@slideshow)
  heading :text => "Finished"
  if next_walkthrough
    directions :text => "Congratulations!  You completed this tutorial.  Feel free to play and experiment with it and when you're ready, head to the next tutorial"
    line_break
    directions :text => "Next up is:"
    tutorial_link :id => "next_slideshow", :slideshow => next_walkthrough.slideshow, :title => next_walkthrough.title, :text => " #{next_walkthrough.title}", :styles => "directions_tutorial_link", :toc_link_id => next_walkthrough.id
  else
    directions :text => "Congratulations!  You completed the last tutorial.  Feel free to play and experiment with it and when you're ready, start your own Limelight Production."
  end
end