module LimelightRDoc
  class ClassFileWriter
    def initialize(klass, outputdir)
      @klass = klass
      @outputdir = outputdir
    end
  
    def write
      File.open(class_file_name, "w+") do |file|
        file.puts "class_name :text => '#{@klass.name}'"
        write_methods_to(file)
      end
    end
  
    def class_file_name
      return File.join(@outputdir, "#{@klass.name}.rb")
    end
    
    def write_methods_to(file)
      @klass.each_method { |method| file.puts "method_name :text => '#{method.name}'" }
    end
  end  
end