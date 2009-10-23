@match.classes.each do |klass|
  class_result(:width => "100%", :vertical_alignment => :center, :left_padding => 7) do
    icon :players => "image", :image => "images/rdoc_class_result_icon.png", :height => 15
    search_result_link :text => klass.full_name, :class_name => klass.full_name, :players => "search_result"
  end
end
@match.found_methods.each do |method|
  method_result(:width => "100%", :vertical_alignment => :center, :left_padding => 7) do
    icon :players => "image", :image => "images/rdoc_method_result_icon.png", :height => 15
    search_result_link :text => "#{method.name}() in #{method.class_name}", :class_name => method.class_name, :players => "search_result"
  end
end