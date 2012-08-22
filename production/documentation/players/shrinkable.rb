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
  self.parent.grow if shrinkable_parent?
end

def shrunk?
  return @shrunk
end

private ####################

def shrinkable_parent?
  #self.parent.players && self.parent.players.match(/shrinkable/) || self.parent.name == "shrinkable"
  self.parent.name == "shrinkable"
end
