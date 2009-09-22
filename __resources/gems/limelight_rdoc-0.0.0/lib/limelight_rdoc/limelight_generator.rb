gem 'rdoc'
require 'limelight_rdoc/class_file_writer'
require 'limelight_rdoc/toc_writer'
require 'rdoc/rdoc'
require 'rdoc/top_level'

module RDoc
  module Generator
    class Limelight
      include FileUtils
      
      def self.for(options)
        return self.new(options)
      end
      
      def initialize(options)
        @outputdir = File.expand_path(options.op_dir)
      end
    
      def generate(top_levels)
        write_toc_file
        TopLevel.all_classes_and_modules.each { |klass| write_class_file_for(klass) }
      end
      
      def write_class_file_for(klass)
        LimelightRDoc::ClassFileWriter.new(klass, @outputdir).write
      end
      
      def write_toc_file
        LimelightRDoc::TocWriter.new(TopLevel.all_classes_and_modules, @outputdir).write
      end
    end
  end
end

RDoc::RDoc.add_generator(RDoc::Generator::Limelight)