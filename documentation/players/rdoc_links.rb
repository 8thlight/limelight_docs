require 'section_stack'

module RdocLinks
  
  def casted
    @section_props = SectionStack.new self
    if scene.rdoc != nil
      sorted_rdoc_classes.each { |class_name| @class_name = class_name; build_class_link }
    end 
  end
  
  protected ###############################################
  
  def sorted_rdoc_classes
    return scene.rdoc.keys.sort do |a, b|
      if a.match(/::/) and b.match(/::/).nil?
        -1
      elsif b.match(/::/) and a.match(/::/).nil?
        1
      else
        a <=> b
      end
    end
  end
  
  def build_class_link 
    write_section
  end
  
  def write_section  
    @head, @tail = split_class
    write_section_headers
    write_class_link
  end
  
  def write_section_headers
    @head.each do |text|
      add_header_prop_with(text)
      create_rdoc_section_with(text)
    end
  end
  
  def write_class_link
    parent_prop.build(:text => @tail, :class_name => @class_name) do
      class_link :text => @text, :class_name => @class_name
    end
  end
  
  def add_header_prop_with(text)
    parent_prop.build(:text => text, :prop_to_remove => section_id_from(text)) do
      class_header :text => @text, :players => "section_header", :prop_to_remove => @prop_to_remove
    end
  end
  
  def create_rdoc_section_with(text)
    parent_prop.build(:id => "#{section_id_from(text)}") do
      class_section :id => @id, :players => "shrinkable", :start_shrunk => true
    end
    
    @section_props.add(text, parent_prop.children.last)
  end
  
  def split_class
    split_class_name = adjusted_class_name
    class_name = split_class_name.pop
    return split_class_name, class_name
  end
  
  def adjusted_class_name
    while not(@class_name =~ /#{@section_props.namespace_string}/)
      @section_props.pop
    end

    name = @class_name.gsub(@section_props.namespace_string, "")
    name.gsub!(/^::/, "")
    
    return name.split('::')    
  end
  
  def section_id_from(text)
    return "#{@section_props.namespace_string.downcase}_#{text.downcase}_links" unless @section_props.namespace_string.empty?
    return "#{text.downcase}_links"
  end
  
  def parent_prop
    @section_props.last_prop
  end
end