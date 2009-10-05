require "toc_section"
TocSection.all.each do |section|
  section do
    section_header :text => section.name, :width => "100%"
    section.links.each do |link|
      tutorial_link :id => link.id,  :text => link.text, :slideshow => link.slideshow, :title => link.title, :styles => "toc_tutorial_link", :toc_link_id => link.id
    end
  end
end