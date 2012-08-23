require 'limelight/mouse'

attr_accessor :toc_link_id, :section_id
  
on_mouse_clicked do
  scene.find(@section_id).open_section
  Limelight::Mouse.new.click scene.find(@toc_link_id)
end
