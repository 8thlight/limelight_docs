module SandboxCodeblock
  def code
    children.collect {|child| child.text}.join("\n")
  end
  
  def mouse_clicked(e)
    prop = scene.find("code")
    prop.text = code if prop
  end
end