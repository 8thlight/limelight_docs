require 'limelight_rdoc/comment_formatter'

module LimelightRDoc
  module Generators
    class Constant
      def initialize(constant, props)
        @constant = constant
        @props = props
      end
    
      def generate
        @props.puts "rdoc_constant do"
        @props.puts "rdoc_constant_name :text => '#{@constant.name}'"
        CommentFormatter.format("rdoc_constant", @constant.comment).each { |line| @props.puts line }
        @props.puts "end"
      end
    end
  end
end