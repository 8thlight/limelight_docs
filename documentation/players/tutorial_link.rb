require 'entrance'
require 'documentation/players/select_link'

module TutorialLink
  
  attr_accessor :slideshow, :title, :toc_link_id
  
  def mouse_clicked(e)
    Entrance.cue_tutorial(scene, self.slideshow, self.title)
    SelectLink.new({:scene => scene, :name => "tutorial_link", :id => toc_link_id}).select
  end
  
end