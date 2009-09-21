module TocHeading
  attr_accessor :tab_content
  
  def mouse_clicked(event)
    unselect_all_headings
    select_current_heading
  end
  
  def unselect_all_headings
    scene.find_by_name('toc_heading').each do |heading|
      heading.style.add_extension(unselected_style)
      heading.style.remove_extension(selected_style)
    end
  end
  
  def select_current_heading
    style.add_extension(selected_style)
    style.remove_extension(unselected_style)
  end
  
  def selected_style
    scene.styles['selected_toc_heading']
  end
  
  def unselected_style
    scene.styles['unselected_toc_heading']
  end
end