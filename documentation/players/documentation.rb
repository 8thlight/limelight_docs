require 'rdoc_loader'
module Documentation
  THREAD_PRIORITY = -1000
  
  attr_accessor :rdoc
  
  def scene_opened(we_dont_care)
    thread = Thread.new(scene) do |scene|
      sleep_to_allow_interactivity
      rdoc_loader = RDocLoader.new(scene)
      rdoc_loader.load
    end
    thread.priority = THREAD_PRIORITY
  end
  
  def select_toc_prop(prop)
    @last_selected_toc_link.style.remove_extension(scene.styles['selected_toc_item']) if @last_selected_toc_link
    @last_selected_toc_link = prop
    prop.style.add_extension(scene.styles['selected_toc_item'])
  end
  
  private ########################
  
  def sleep_to_allow_interactivity
    Kernel.sleep(2)
  end
end