module Shrinkable
  attr_accessor :start_shrunk
  
  def casted
    @height = self.style.height
    self.shrink
  end
  
  def shrink
    @shrunk = true
    self.style.height = '0'
  end
  
  def grow
    @shrunk = false
    self.style.height = @height
  end
  
  def shrunk?
    return @shrunk
  end
end