on_mouse_clicked do
  if system('jruby -v')
    self.text = "SUCCESS"
  else
    self.text = "ERROR"
  end
end
