module ToggleSource
  def mouse_clicked(event)
    if codeblock.style.height == "0"
      self.text = "Hide Source"
      codeblock.style.height = "auto"
    else
      self.text = "Show Source"
      codeblock.style.height = 0 
    end
    scene.find("content_pane").update_now
  end
  
  private ######################
  
  def codeblock
    return self.parent.children[1]
  end
  
end