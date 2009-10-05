module RdocLinks
  def casted
    @namespaces = []
    if scene.rdoc != nil
      scene.rdoc.keys.sort.each { |class_name| @class_name = class_name; build_class_link }
    end 
  end
  
  protected ###############################################
  
  def build_class_link
    write_section
  end
  
  def write_section
    @head, @tail = split_class
    write_section_headers    
    self.build(:class_text => @tail) { class_link :text => @class_text }
  end
  
  def write_section_headers
    @head.each do |name|
      self.build(:text => name) { class_header :text => @text }
      @namespaces.push name
    end
  end
  
  def split_class
    split_class_name = adjusted_class_name
    class_name = split_class_name.pop
    return split_class_name, class_name
  end
  
  def adjusted_class_name
    if !@namespaces.empty?
      namespace_string = @namespaces.join("::").concat("::")
      name = @class_name.gsub(namespace_string, "")
    else
      name = @class_name
    end
    
    return name.split('::')    
  end
end