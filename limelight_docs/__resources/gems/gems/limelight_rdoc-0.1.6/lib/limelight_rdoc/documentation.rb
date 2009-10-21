require "rdoc/top_level"
Match = Struct.new(:classes)

module LimelightRDoc
  class Documentation < Hash
    
    def search(criteria)
      return Match.new([]) if criteria.empty?
      classes = documented_classes.select { |klass| klass.full_name.downcase.match(criteria.downcase) }
      return Match.new(classes)
    end
    
    # I can be a class level method to remove duplication hint hint
    def documented_classes
      RDoc::TopLevel.all_classes_and_modules.select{|klass| klass.document_self }
    end
  end
end