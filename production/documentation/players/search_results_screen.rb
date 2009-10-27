module SearchResultsScreen
  attr_reader :selected
  
  def next
    with_children do
      @selected ||= -1
      (@selected = (@selected + 1) % children.size)
      select_child(@selected)
    end
  end
  
  def previous
    with_children do
      @selected ||= children.size
      @selected = (@selected - 1) % children.size
      select_child(@selected)
    end
  end

  def show_current
    children[@selected].mouse_clicked(nil) if @selected
  end
  
  def select_child(selected)
    @selected = selected
    children.each_with_index do |child, index|
      if index == selected
        select(child)
      else
        deselect(child)
      end
    end
    adjust_scroll_bar if selected_offscreen?
  end

private
  
  def adjust_scroll_bar
  end
  
  def selected_offscreen?
  end
  
  def with_children
    yield unless children.empty?
  end

  def select(child)
    child.style.add_extension(scene.styles['selected_result'])
  end
  
  def deselect(child)
    child.style.remove_extension(scene.styles['selected_result'])
  end
end