module VerifyJrubyButton
  
  def mouse_clicked(e)
    if system('jruby -v')
      self.text = "SUCCESS"
    else
      self.text = "ERROR"
    end
  end
end