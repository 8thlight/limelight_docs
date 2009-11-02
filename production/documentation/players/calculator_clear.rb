module CalculatorClear
  def mouse_clicked(event)
    scene.find("calculator_display").text = ""
  end
end