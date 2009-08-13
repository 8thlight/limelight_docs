module NextButton
  
  def mouse_clicked(event)
    scene.navigator.next
    scene.find("step1").text = "Check that Java is installed"
  end
end