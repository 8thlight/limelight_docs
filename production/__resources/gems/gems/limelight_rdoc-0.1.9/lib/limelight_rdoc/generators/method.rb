require 'limelight_rdoc/comment_formatter'
require "limelight_rdoc/generators/method_source"

module LimelightRDoc
  module Generators
    class Method
    
      def initialize(method, props)
        @method = method
        @props = props
      end
    
      def write
        @props.puts "method do"
        @props.puts "method_header do"
        @props.puts "method_name :text => '#{@method.name}'"
        @props.puts "method_parameters :text => '#{@method.params}'"
        @props.puts "end"
        CommentFormatter.format("method", @method.comment).each { |line|  @props.puts line }
        @props.puts "source do"
        @props.puts "toggle_source :text => 'Show Source'"
        source_lines.each { |line| @props.puts line }
        @props.puts "end"
        @props.puts "end"
      end
    
      private ###################
    
      def source_lines
        return MethodSource.new.convert(@method.token_stream)
      end
    end
  end
end