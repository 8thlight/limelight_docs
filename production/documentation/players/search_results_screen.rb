module SearchResultsScreen
  def next
    with_children do
      @selected ||= -1
      (@selected = (@selected + 1) % children.size)
      select_child(@selected);
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
    children[@selected].children[1].mouse_clicked(nil) if @selected
  end
  
private
  
  def with_children
    yield unless children.empty?
  end
  
  def select_child(selected)
    children.each_with_index do |child, index|
      if index == selected
        select(child)
      else
        deselect(child)
      end
    end
  end

  def select(child)
    child.style.add_extension(scene.styles['selected_result'])
  end
  
  def deselect(child)
    child.style.remove_extension(scene.styles['selected_result'])
  end
end