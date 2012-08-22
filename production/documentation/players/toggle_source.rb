on_mouse_clicked do
  if _codeblock.style.height == "0"
    self.text = "Hide Source"
    _codeblock.style.height = "auto"
  else
    self.text = "Show Source"
    _codeblock.style.height = 0 
  end
  scene.find("content_pane").update_now
end


def _codeblock
  return self.parent.children[1]
end
