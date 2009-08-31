module SandboxCodeblock
  def code
    children.collect {|child| child.text}.join("\n")
  end
  
  def mouse_clicked(e)
    code_box = scene.find("code")
    code_box.text = code if code_box
  end
end