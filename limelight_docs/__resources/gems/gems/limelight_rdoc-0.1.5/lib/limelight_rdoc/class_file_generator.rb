require 'limelight_rdoc/comment_formatter'
require 'limelight_rdoc/prop_string'
require 'limelight_rdoc/attribute_generator'
require 'limelight_rdoc/constant_generator'
require 'limelight_rdoc/method_generator' # glob this


module LimelightRDoc
  class ClassFileGenerator
    attr_reader :props
    
    def initialize(klass)
      @klass = klass
      @props = PropString.new
    end
  
    def write
      write_class_info
      write_constants
      write_attribute_info
      write_methods
    end
  
    def write_class_info
      @props.puts "class_name :text => 'ClassName: #{@klass.full_name}'"
      CommentFormatter.format("class", @klass.comment).each { |line| @props.puts line }
    end
    
    def write_constants
      return if @klass.constants.empty?
      @props.puts "rdoc_constant_header :text => 'Constants'"
      @props.puts "rdoc_constants do"
      @klass.each_constant do |constant|
        ConstantGenerator.new(constant, @props).generate
      end
      @props.puts "end"
    end
    
    def write_attribute_info
      return if @klass.attributes.empty?
      @props.puts "attributes_header :text => 'Attributes'"
      @props.puts "attributes do"
      @klass.each_attribute do |attribute|
        AttributeGenerator.new(attribute, @props).write
      end
      @props.puts "end"
    end
    
    def write_methods
      return if @klass.method_list.empty?      
      @props.puts "public_methods_header :text => 'Public Methods'"
      @klass.each_method do |method|
        MethodGenerator.new(method, @props).write
      end
    end
  end  
end