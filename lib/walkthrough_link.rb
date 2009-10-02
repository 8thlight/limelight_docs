require 'toc_section' #temporary circular dependency

class WalkthroughLink
  attr_reader :id, :text, :slideshow, :title
  
  def self.all
    TocSection.all_walkthrough_links
  end
  
  def self.next(current_slideshow)
    all.each_with_index { |link, index| return all[index + 1] if link.slideshow == current_slideshow }
    return nil
  end
    
  def self.find(id)
    link = all.find {|link| link.id == id}
    return link
  end
  
  def initialize(options)
    @id = options[:id]
    @text = options[:text]
    @slideshow = options[:slideshow]
    @title = options[:title]
  end
end