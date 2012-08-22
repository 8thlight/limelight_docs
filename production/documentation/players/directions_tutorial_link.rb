attr_accessor :toc_link_id, :section_id
  
on_mouse_clicked do
  scene.find(@section_id).open_section
  scene.find(@toc_link_id).mouse_clicked(nil)
end
