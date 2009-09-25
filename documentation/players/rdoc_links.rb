module RdocLinks
  def casted
    production.rdoc.keys.sort.each { |class_name| build_class_link_for(class_name) }
  end
  
  def build_class_link_for(class_name)
    self.build(:class_text => class_name) { class_link :text => @class_text }
  end
end