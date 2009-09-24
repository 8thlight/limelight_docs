gem 'rdoc'
require 'limelight_rdoc/class_file_generator'
require 'rdoc/rdoc'
require 'rdoc/top_level'

module RDoc
  module Generator
    class Limelight
      include FileUtils
      attr_reader :class_dir, :file_dir, :props
      
      def self.for(options)
        return self.new
      end
      
      def initialize
        @props = {}
      end
    
      def generate(top_levels = nil)
        TopLevel.all_classes_and_modules.each { |klass| write_class_file_for(klass) }
      end
      
      def write_class_file_for(klass)
        writer = LimelightRDoc::ClassFileGenerator.new(klass)
        writer.write
        @props[klass.full_name] = writer.props
      end
    end
  end
end

RDoc::RDoc.add_generator(RDoc::Generator::Limelight)