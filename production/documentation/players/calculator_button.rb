module CalculatorButton
  def mouse_clicked(event)
    scene.find("calculator_display").text += self.text
  end
end