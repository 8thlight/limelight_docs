slide do
  heading :text => "11. Your Turn"
  directions :text => "Congratulations!  You've created your first Limelight application.  Feel free to play and experiment with it and when you're ready, head to the next tutorial."
  next_walkthrough = WalkthroughLink.next(@slideshow)
  toc_link :id => "next_slideshow", :slideshow => next_walkthrough.slideshow, :title => next_walkthrough.title, :text => next_walkthrough.text
end