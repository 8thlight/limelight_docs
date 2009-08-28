module SandboxButton
  
  def button_pressed(e)
    canvas = scene.find('canvas')
    canvas.remove_all
    code = scene.find('code')
    canvas.build do
      begin
        eval(code.text)
      rescue Exception => e
        prop :text => e.message.gsub('(eval):1: ', "Syntax error: "), :id => 'error'
      end
    end
  end
  
end
