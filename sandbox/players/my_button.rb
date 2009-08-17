module MyButton
  def button_pressed(e)
    canvas = scene.find('canvas')
    code = scene.find('code')
    canvas.build do
      # puts code.text
      eval(code.text)
    end
  end
end