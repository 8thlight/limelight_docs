require "rdoc/top_level"
Match = Struct.new(:classes, :found_methods, :comments)
FoundMethod = Struct.new(:name, :class_name)
Comment = Struct.new(:text, :class_name)

module LimelightRDoc
  class Documentation < Hash
    
    def search(criteria)
      return Match.new([], [], []) if criteria.empty?
      @criteria = criteria
      return Match.new(found_classes, found_methods, found_comments)
    end
    
    def found_classes
      return documented_classes.select { |klass| klass.full_name.downcase.match(@criteria.downcase) }
    end
    
    def found_methods
      list = []
      documented_classes.each do |klass|
        klass.method_list.each do |method|
          list << FoundMethod.new(method.name, klass.full_name) if method.name.downcase.match(@criteria.downcase)
        end
      end
      return list
    end

    def found_comments
      comments = []
      documented_classes.each do |klass|
        comments << Comment.new(klass.comment, klass.full_name) if klass.comment.downcase.match(@criteria.downcase)
      end
      comments
    end

    # I can be a class level method to remove duplication hint hint
    def documented_classes
      RDoc::TopLevel.all_classes_and_modules.select{|klass| klass.document_self }
    end
    
  end
end