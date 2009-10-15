require "toc_section"
TocSection.all.each do |section|
  section do
    section_header :id => "#{section.name}", :text => section.name, :width => "100%", :prop_to_remove => "#{section.name}_links", :start_shrunk => section.start_shrunk?
    section_links :id => "#{section.name}_links", :players => "shrinkable" do
      section.links.each do |link|
        tutorial_link :id => link.id,  :text => link.text, :slideshow => link.slideshow, :title => link.title, :styles => "toc_tutorial_link"
      end
    end
  end
end