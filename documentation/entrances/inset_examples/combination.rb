left_prop do
  red_square :background_color => :red, :height => 30, :width => 30
end
right_prop :border_width => 1, :border_color => :black, :width => "60%", :height => "100%" do
  inner_prop do
    blue_square :background_color => :blue, :height => 30, :width => 30
  end
end