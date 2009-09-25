class Entrance
  
  def self.cue_tutorial(scene, slideshow, title=nil)
    update_content_pane(scene) {__install "documentation/entrances/tutorial.rb", {:slideshow => slideshow, :title => title} }
  end
    
  def self.cue_common(scene, name)
    update_content_pane(scene) {__install "documentation/common/#{name}.rb" }
  end
  
  def self.cue_rdoc(scene, prop_dsl)
    update_content_pane(scene) { eval(prop_dsl) }
  end
  
  def self.update_content_pane(scene)
    find_content_pane(scene)
    @@pane.build do
      yield
    end
  end
  
  def self.find_content_pane(scene)
    @@pane = scene.find("content_pane")
    @@pane.remove_all
  end
end
