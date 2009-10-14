module Shrinkable
  attr_accessor :start_shrunk
  
  def casted
    @height = self.style.height
    self.shrink
  end
  
  def shrink
    self.style.height = '0'
  end
  
  def grow
    self.style.height = @height
  end
  
  def shrunk?
    return true if self.style.height == '0'
  end
end