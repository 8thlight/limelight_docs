module Section
  
  def open
    self.children[1].grow
  end
  
  def close
    self.children[1].shrink
  end
  
end