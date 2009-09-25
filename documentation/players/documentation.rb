require 'rdoc_loader'
module Documentation
  attr_accessor :rdoc
  
  def casted
    RDocLoader.new(scene).load
  end
end