module LimelightRDoc
  class TocWriter
    
    def initialize(classes, directory)
      @toc_file = File.join(directory, "toc.rb")
      @classes = classes
    end
    
    def write
      File.open(@toc_file, "w+") { |file| write_toc_entries_to(file) }
    end
    
    def write_toc_entries_to(file)
      @classes.each { |klass| file.puts "toc_entry :text => '#{klass.name}', :class_prop_file => '#{klass.name}.rb'" }
    end
  end
end