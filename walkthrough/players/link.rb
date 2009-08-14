module Link
  attr_accessor :url
  
  def mouse_clicked(e)
    # Demeter is my bitch
    Java::limelight.Context.instance.os.openURL(self.url)
  end
end