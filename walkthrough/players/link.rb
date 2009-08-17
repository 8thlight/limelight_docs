module Link
  attr_accessor :url
  
  def mouse_clicked(e)
    launch(self.url)
  end
end