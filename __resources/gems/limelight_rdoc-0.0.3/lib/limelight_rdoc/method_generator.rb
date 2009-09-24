require 'limelight_rdoc/comment_formatter'

module LimelightRDoc
  class MethodGenerator
    
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
      @props.puts "end"
    end
  end
end