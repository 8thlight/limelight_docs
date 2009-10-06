module Shrinkable
  def casted
    @height = self.style.height
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