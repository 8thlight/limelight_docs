module SandboxButton
  def button_pressed(e)
    canvas = scene.find('canvas')
    canvas.remove_all
    code = scene.find('code')
    canvas.build do
      begin
        eval(code.text)
      rescue Exception => e
        prop :text => e.message
      end
    end
  end
end