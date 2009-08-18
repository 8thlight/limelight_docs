module SandboxButton
  def button_pressed(e)
    canvas = scene.find('canvas')
    code = scene.find('code')
    canvas.build do
      eval(code.text)
    end
  end
end