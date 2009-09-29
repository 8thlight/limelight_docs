require 'statemachine'

module LimelightRDoc
  class CommentFormatter
    class << self
      def format(prefix, comment)
        return [] if comment.nil? || comment.empty?
        
        @@comment = comment.gsub(/'/, "\\\\'")
        @@prefix = prefix
        build_state_machine
        return array_of_props
      end

      def build_state_machine
        @@comment_parser = Statemachine.build do
          superstate :construction do
            state :constructing do
              event :next_line, :parsing_description
            end

            state :parsing_description do
              on_entry :evaluate_line
              event :complete_description, :constructing, :complete_description
              event :continue_line, :constructing, :append_to_current_line
              event :codeblock, :codeblock, :write_codeblock
            end
            
            event :complete, :end, :complete_description
          end
          
          state :codeblock do
            on_entry :evaluate_codeblock
            event :next_line, :codeblock
            event :complete_codeblock, :parsing_description, :complete_codeblock
            event :complete, :end, :complete_codeblock
          end
          
          context CommentFormatter.new
        end
        
        @@comment_parser.context.prefix = @@prefix
      end

      def array_of_props
        @@comment.split("\n").each { |line| @@comment_parser.next_line line }
        @@comment_parser.complete
        return @@comment_parser.context.props
      end
    end
    
    attr_accessor :statemachine, :prefix
    
    def initialize
      @props = []
      @current_line = ""
    end
    
    def props
      return @props
    end
    
    def line_without_initial_pound(line)
      return line.gsub(/^\s*#/, '')
    end
    
    def parse_comment_line(line)
      line_without_initial_pound(line).strip
    end
    
    def append_to_current_line(line)
      @current_line << " #{parse_comment_line(line)}"
    end
    
    def complete_description
      @props << "#{@prefix}_description :text => '#{parse_comment_line(@current_line)}'" unless parse_comment_line(@current_line).empty?
      @current_line = ""
    end
    
    def write_codeblock(line)
      complete_description
      @props << "codeblock do"
    end
    
    def evaluate_line(line)
      if parse_comment_line(line).empty?
        @statemachine.complete_description
      elsif is_codeblock(line)
        @statemachine.codeblock(line)
      else
        @statemachine.continue_line(line)
      end
    end
    
    def write_code(line)
      @props << "code :text => '#{line_without_initial_pound(line)}'"
    end
    
    def complete_codeblock
      @props << "end"
    end
    
    def evaluate_codeblock(line)
      if is_codeblock(line)
        write_code(line) # Should change a state - not do anything.
      else
        @statemachine.complete_codeblock(line)
      end
    end
    
    def is_codeblock(line)
      line =~ /^#\s\s/ || line =~ /^#\t/
    end
  end
end