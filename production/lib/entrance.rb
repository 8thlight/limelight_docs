class Entrance
  
  def self.cue_tutorial(scene, slideshow, title=nil)
    @@scene = scene
    update_content_pane_from_file("../documentation/entrances/tutorial.rb", {:slideshow => slideshow, :title => title})
  end
    
  def self.cue_common(scene, name)
    @@scene = scene
    update_content_pane_from_file("../documentation/common/#{name}.rb")
  end
  
  def self.cue_rdoc(scene, prop_dsl)
    @@scene = scene
    update_content_pane_from_dsl(prop_dsl)
  end
  
  # Tried to remove this duplication several times and was murdered by the meta gods.  Feel free to try.
  def self.update_content_pane_from_file(install_file, options={})
    find_content_pane
    
    @@pane.build do
      __install install_file, options
    end
  end
  
  def self.update_content_pane_from_dsl(prop_dsl)
    find_content_pane

    @@pane.build do
      eval "rdoc_canvas do\n#{prop_dsl}\nend"
    end
  end
  
  def self.find_content_pane
    @@pane = @@scene.find("content_pane")
    @@pane.remove_all
  end
end
