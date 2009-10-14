module Documentation
  
  def enable_rdoc_tab
    prop = find('RDoc') 
    return if prop.nil?
    prop.style.add_extension(styles['unselected_toc_heading'])
    prop.style.remove_extension(styles['disabled_toc_heading'])
  end
    
  def scene_opened(we_dont_care)
    enable_rdoc_tab if rdoc != nil
  end
  
  def select_toc_prop(prop)
    @last_selected_toc_link.style.remove_extension(scene.styles['selected_toc_item']) if @last_selected_toc_link
    @last_selected_toc_link = prop
    prop.style.add_extension(scene.styles['selected_toc_item'])
  end
  
  def rdoc
    return production.rdoc
  end
  
end