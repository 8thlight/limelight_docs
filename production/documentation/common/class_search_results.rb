@match.classes.each do |klass|
  search_result :class_name => klass.full_name do
    icon :players => "image", :image => "images/rdoc_class_result_icon.png", :height => 15
    search_result_link :text => klass.full_name
  end
end
@match.found_methods.each do |method|
  search_result :class_name => method.class_name do
    icon :players => "image", :image => "images/rdoc_method_result_icon.png", :height => 15
    search_result_link :text => "#{method.name}() in #{method.class_name}"
  end
end
@match.comments.each do |comment|
  search_result :class_name => comment.class_name do
    icon :players => "image", :image => "images/rdoc_comment_result_icon.png", :height => 15
    search_result_link :text => "#{comment.text[1,20]}... in #{comment.class_name}"
  end
end