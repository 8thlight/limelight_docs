require 'rdoc_loader'
module Documentation
  THREAD_PRIORITY = -1000
  
  attr_accessor :rdoc
  
  def scene_opened(we_dont_care)
    thread = Thread.new(scene) do |scene|
      Kernel.sleep(3)
      RDocLoader.new(scene).load
    end
    thread.priority = THREAD_PRIORITY
  end
end