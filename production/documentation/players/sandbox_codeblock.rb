def code
  children.collect {|child| child.text}.join("\n")
end

on_mouse_clicked do
  code_box = scene.find("code")
  code_box.text = code if code_box
end
