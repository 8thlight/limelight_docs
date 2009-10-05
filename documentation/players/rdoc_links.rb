module RdocLinks
  def casted
    @namespaces = []
    if scene.rdoc != nil
      scene.rdoc.keys.sort.each { |class_name| @class_name = class_name; build_class_link }
    end 
  end
  
  protected ###############################################
  
  def build_class_link
    write_section_headers
  end
  
  def write_section_headers
    if !@namespaces.empty?
      namespace_string = @namespaces.join("::").concat("::")
      adjusted_class_name = @class_name.gsub(namespace_string, "")
    else
      adjusted_class_name = @class_name
    end
    
    @split_class_name = adjusted_class_name.split('::')
    @class_name = @split_class_name.pop
    
    @split_class_name.each do |name|
      # if index != @split_class_name.size - 1
        self.build(:text => name) { class_header :text => @text }
        @namespaces << name
      # end
    end
    
    self.build(:class_text => @class_name) { class_link :text => @class_text }
  end
  
  # def split
  #   
  # end
end