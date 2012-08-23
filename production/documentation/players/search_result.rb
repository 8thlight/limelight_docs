attr_accessor :class_name

def selected?
  _has_seclected_result?
end

on_mouse_clicked do
  _click_class_link scene.find("class_link_#{class_name}")
  scene.remove(scene.find('search_results_screen'))
end

on_mouse_entered do
  #test me
  index = self.parent.children.rindex(self)
  self.parent.select_child(index)
end

def _click_class_link(link)
  mouse.click link
end

def _has_seclected_result?
  style.has_extension(scene.styles['selected_result'])
end
