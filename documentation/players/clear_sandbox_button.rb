module ClearSandboxButton
  
  def button_pressed(e)    
    scene.find('canvas').remove_all
  end
  
end
