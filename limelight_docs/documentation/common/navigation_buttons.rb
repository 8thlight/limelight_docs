navigation_pane do
  left_navigation do
    previous_button :id => "previous"
  end

  middle_navigation do
    navigation_title :text => @title
    slideshow_progress :id => "slideshow_progress" do
      progress_bar :width => "100%"
      progress_text
    end
  end

  right_navigation do
    next_button :id => "next"
  end
end