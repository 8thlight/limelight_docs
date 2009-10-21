@classes.each do |klass|
  found_class do
    class_link :text => klass.full_name, :class_name => klass.full_name, :players => "search_result"
  end
end