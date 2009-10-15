require 'limelight_rdoc/limelight_generator'

module LimelightRDoc
  class LimelightRDoc
    class << self
      def document(directory, output_directory)
        @@directory = directory
        @@output_directory = output_directory
        load_props
        clear_output_directory
        write_props_to_files        
      end
      
      def load_props
        ll_rdoc = LimelightRDoc.new
        @@props = ll_rdoc.props_from(@@directory)
      end
      
      def clear_output_directory
        FileUtils.rm_rf(@@output_directory)
        FileUtils.mkdir(@@output_directory)        
      end
      
      def write_props_to_files
        @@props.each_pair do |classname, propdsl|
          write_file(classname, propdsl)
        end
      end
      
      def write_file(classname, propdsl)
        File.open(class_path_for(classname), "w+") { |file| file.write propdsl }
      end
      
      def class_path_for(classname)
        return File.join(File.expand_path(@@output_directory), "#{classname}.rb")
      end
    end
    
    def initialize
      @generator =  RDoc::Generator::Limelight.new
    end
    
    def props_from(directory)
      @directory = directory
      parse_rdoc
      @generator.generate
      return @generator.props
    end
    
    def parse_rdoc
      reset_top_level
      rdoc = RDoc::RDoc.new
      rdoc.options = options
      rdoc.parse_files
    end
    
    def reset_top_level
      RDoc::TopLevel.reset
    end
    
    def options
      if @options.nil?
        @options = RDoc::Options.new
        @options.parse ["--fmt=limelight", @directory]
      end
      return @options
    end
  end
end