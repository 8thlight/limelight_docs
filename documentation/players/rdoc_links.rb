module RdocLinks
  def casted
    if scene.rdoc != nil
      scene.rdoc.keys.sort.each { |class_name| build_class_link_for(class_name) }
    end 
  end
  
  def build_class_link_for(class_name)
    self.build(:class_text => class_name) { class_link :text => @class_text }
  end
end