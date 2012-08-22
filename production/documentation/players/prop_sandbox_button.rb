on_button_pushed do
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
