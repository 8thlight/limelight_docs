module TocHeading
  attr_accessor :tab_content
  
  def mouse_clicked(event)
    return if already_selected? || disabled?
    unselect_all_headings
    select_current_heading
    load_new_toc_links
    clear_content_pane
  end
  
  def enable
    style.text_color = "#222"
    
    self.style.add_extension(unselected_style)
    self.style.remove_extension(disabled_style)
    self.style.remove_extension(selected_style)
  end
  
  def already_selected?
    self.style.has_extension(selected_style)
  end

  def disabled?
    self.style.has_extension(disabled_style)
  end
  
  def unselect_all_headings
    scene.find_by_name('toc_heading').each do |heading|
      heading.style.background_color = "#ccc"

      heading.style.add_extension(unselected_style)
      heading.style.remove_extension(selected_style)
    end
  end
  
  def select_current_heading
    style.background_color = "#8fc927"
    
    style.add_extension(selected_style)
    style.remove_extension(unselected_style)
  end
  
  def load_new_toc_links
    arbitrary_wrapper = scene.find("arbitrary_wrapper")
    clear_arbitrary_wrapper(arbitrary_wrapper)
    build_new_toc_links_on(arbitrary_wrapper)
  end
  
  def clear_arbitrary_wrapper(arbitrary_wrapper)
    arbitrary_wrapper.remove_all
    
    handle_redraw_bug_with_full_size_prop_on(arbitrary_wrapper)
    arbitrary_wrapper.remove_all
  end
  
  def build_new_toc_links_on(arbitrary_wrapper)
    arbitrary_wrapper.build(:partial_name => "#{self.id.downcase}_links.rb") do
      __install "documentation/#{@partial_name}"
    end
  end
  
  def clear_content_pane
    content_pane = scene.find("content_pane")
    content_pane.remove_all
    handle_redraw_bug_with_full_size_prop_on(content_pane)
  end
    
  def selected_style
    scene.styles['selected_toc_heading']
  end

  def unselected_style
    scene.styles['unselected_toc_heading']
  end

  def disabled_style
    scene.styles['disabled_toc_heading']
  end
  
  #needed for redraw bug
  def handle_redraw_bug_with_full_size_prop_on(content_pane)
    content_pane.build do
      empty_prop :height => "100%", :width => "100%"
    end
  end
end