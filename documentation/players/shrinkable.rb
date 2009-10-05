module Shrinkable
  def casted
    @height = self.style.height
    @width = self.style.width
  end
  
  def shrink
    self.style.height = '0'
    self.style.width = '0'
  end
  
  def grow
    self.style.height = @height
    self.style.width = @width
  end
  
  def shrunk?
    return true if self.style.height == '0' and self.style.width == '0'
  end
end