@match.classes.each do |klass|
  search_result do
    icon :players => "image", :image => "images/rdoc_class_result_icon.png", :height => 15
    search_result_link :text => klass.full_name, :class_name => klass.full_name, :players => "search_result"
  end
end
@match.found_methods.each do |method|
  search_result do
    icon :players => "image", :image => "images/rdoc_method_result_icon.png", :height => 15
    search_result_link :text => "#{method.name}() in #{method.class_name}", :class_name => method.class_name, :players => "search_result"
  end
end
@match.comments.each do |comment|
  search_result do
    icon :players => "image", :image => "images/rdoc_method_result_icon.png", :height => 15
    search_result_link :text => "#{comment.text[0,20]}... in #{comment.class_name}", :class_name => comment.class_name, :players => "search_result"
  end
end