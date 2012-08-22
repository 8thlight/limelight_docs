attr_accessor :url

on_mouse_clicked do
  launch(self.url)
  scene.find("slideshow").next
end
