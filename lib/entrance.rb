class Entrance
  
  def self.cue_tutorial(scene, slideshow, title=nil)
    update_content_pane(scene, "documentation/entrances/tutorial.rb", {:slideshow => slideshow, :title => title})
  end
    
  def self.cue_common(scene, name)
    update_content_pane(scene, "documentation/common/#{name}.rb")
  end
  
  def self.cue_rdoc(scene, name)
    update_content_pane(scene, "documentation/entrances/rdoc.rb", {:rdoc_propfile => name})
  end
  
  def self.update_content_pane(scene, install_file, options={})
    pane = scene.find("content_pane")    
    pane.remove_all
    
    pane.build do
      __install install_file, options
    end
  end
end
