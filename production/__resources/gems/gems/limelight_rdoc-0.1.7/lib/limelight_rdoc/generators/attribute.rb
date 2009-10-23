require 'limelight_rdoc/comment_formatter'

module LimelightRDoc
  module Generators
    class Attribute
    
      def initialize(attribute, props)
        @props = props
        @attribute = attribute
      end
    
      def write
        @props.puts "attribute_header do"
        @props.puts "attribute_name :text => '#{@attribute.name}'"
        @props.puts "attribute_read_write :text => '[#{@attribute.rw}]'"
        CommentFormatter.format("attribute", @attribute.comment).each {|line| @props.puts line}
        @props.puts "end"
      end
    end
  end
end