on_mouse_clicked do
  display = scene.find("calculator_display")
  begin
    display.text = eval(display.text)
  rescue SyntaxError
    display.text = ""
  end
end
