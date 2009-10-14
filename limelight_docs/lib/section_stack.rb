class SectionStack
  
  def initialize(root)
    @stack = [[nil, root]]
  end
  
  def add(text, prop)
    @stack << [text, prop]
  end
  
  def namespace_string
    return @stack.collect{|pair| pair.first}.compact.join("::")
  end
  
  def last_prop
    return @stack.last.last
  end
  
  def pop
    @stack.pop
  end
end