require 'limelight_rdoc/comment_formatter'
require 'limelight_rdoc/prop_string'
require 'limelight_rdoc/generators/method'
require 'limelight_rdoc/generators/attribute'
require 'limelight_rdoc/generators/constant'

module LimelightRDoc
  module Generators
    class ClassFile
      attr_reader :props
    
      def initialize(klass)
        @klass = klass
        @props = PropString.new
      end
  
      def write
        write_class_info
        write_classes_and_modules
        write_constants
        write_attribute_info
        write_methods
      end
  
      def write_class_info
        @props.puts "#{prop_name} :text => '#{@klass.full_name}'";
        CommentFormatter.format("class", @klass.comment).each { |line| @props.puts line }
      end

      def write_classes_and_modules
        return if @klass.classes_and_modules.empty?
        @props.puts "rdoc_classes_and_modules_header :text => 'Classes and Modules'"
        @props.puts "rdoc_classes_and_modules do"
        @klass.classes_and_modules.each do |klass|
          @props.puts "rdoc_class_or_module :text => '#{klass.full_name}'" 
        end
        @props.puts "end"
      end
    
      def write_constants
        return if @klass.constants.empty?
        @props.puts "rdoc_constant_header :text => 'Constants'"
        @props.puts "rdoc_constants do"
        @klass.each_constant do |constant|
          Constant.new(constant, @props).generate
        end
        @props.puts "end"
      end
    
      def write_attribute_info
        return if @klass.attributes.empty?
        @props.puts "attributes_header :text => 'Attributes'"
        @props.puts "attributes do"
        @klass.each_attribute do |attribute|
          Attribute.new(attribute, @props).write
        end
        @props.puts "end"
      end
    
      def write_methods
        return if @klass.method_list.empty?      
        @props.puts "public_methods_header :text => 'Public Methods'"
        @klass.each_method do |method|
          Method.new(method, @props).write
        end
      end
            
      def prop_name
        @klass.module? ? "rdoc_module_name" : "rdoc_class_name"        
      end
    end
  end  
end
