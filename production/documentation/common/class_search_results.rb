if @match.classes.empty? && @match.found_methods.empty? && @match.comments.empty?
  search_result_message :text => "No Matches Matching your Search Criteria"
else  
  @match.classes.each do |klass|
    search_result :class_name => klass.full_name do
      if klass.module?
        icon :players => "image", :image => "images/rdoc_module_result_icon.png"
      else
        icon :players => "image", :image => "images/rdoc_class_result_icon.png"
      end
      search_result_link :text => klass.full_name
    end
  end
  @match.found_methods.each do |method|
    search_result :class_name => method.class_name do
      icon :players => "image", :image => "images/rdoc_method_result_icon.png"
      search_result_link :text => "#{method.name}() in #{method.class_name}"
    end
  end
  @match.comments.each do |comment|
    search_result :class_name => comment.class_name do
      icon :players => "image", :image => "images/rdoc_comment_result_icon.png"
      search_result_link :text => "#{comment.text[1,20]}... in #{comment.class_name}"
    end
  end
end