# require 'documentation/players/section_header'
# require 'documentation/players/shrinkable'
# require 'documentation/players/class_link'
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
      new_section = create_rdoc_section_with(text)
      @section_props.add(text, new_section)
    end
  end
  
  def write_class_link
    class_link = Limelight::Prop.new(:text => @tail, :name => "class_link")
    class_link.include_player(ClassLink)
    class_link.class_name = @class_name
    parent_prop.add class_link    
  end
  
  def add_header_prop_with(text)
    parent_prop.add header_prop_with(text)
  end
  
  def header_prop_with(text)
    header = Limelight::Prop.new(:text => text, :name => "class_header")
    header.include_player(SectionHeader)
    header.prop_to_remove = "#{section_id_from(text)}"
    return header
  end
  
  def create_rdoc_section_with(text)
    shrinkable_prop = make_shrinkable_prop_with(text)
    parent_prop.add shrinkable_prop
    return shrinkable_prop
  end
  
  def make_shrinkable_prop_with(text)
    prop = Limelight::Prop.new(:id => "#{section_id_from(text)}", :name => 'class_section')
    prop.include_player(Shrinkable)
    prop.shrink
    return prop
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