require "walkthrough_link"
WalkthroughLink.all.each do |link|
  toc_link :id => link.id,  :text => link.text, :slideshow => link.slideshow, :title => link.title
end
