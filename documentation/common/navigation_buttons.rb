navigation_pane do
  left_navigation :width => "20%", :horizontal_alignment => :left do
    previous_button :id => "previous"
  end

  middle_navigation :width => "60%", :text => @title

  right_navigation :width => "20%", :horizontal_alignment => :right do
    next_button :id => "next"
  end
end