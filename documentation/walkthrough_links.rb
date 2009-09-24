require "walkthrough_link"
WalkthroughLink.all.each do |link|
  tutorial_link :id => link.id,  :text => link.text, :slideshow => link.slideshow, :title => link.title, :styles => "toc_tutorial_link", :toc_link_id => link.id
end
