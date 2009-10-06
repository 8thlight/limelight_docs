module RdocLinks
  def casted
    @namespaces = []
    if scene.rdoc != nil
      scene.rdoc.keys.sort.each { |class_name| build_class_link_for(class_name) }
    end 
  end
  
  protected ###############################################
  
  def build_class_link_for(class_name)
    write_section_headers_for(class_name)
  end
  
  def write_section_headers_for(class_name)
    if !@namespaces.empty?
      namespace_string = @namespaces.join("::").concat("::")
      adjusted_class_name = class_name.gsub(namespace_string, "")
    else
      adjusted_class_name = class_name
    end
    
    split_class_name = adjusted_class_name.split('::')
    split_class_name.each_with_index do |name, index|
      if index != split_class_name.size - 1
        self.build(:text => name) { class_header :text => @text }
        @namespaces << name
      end
    end
    
    self.build(:class_text => split_class_name.last) { class_link :text => @class_text }
  end
end