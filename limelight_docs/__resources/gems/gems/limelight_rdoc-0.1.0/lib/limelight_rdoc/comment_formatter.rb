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
            state :wait do
              event :next_line, :parsing_description
            end

            state :parsing_description do
              on_entry :evaluate_line
              event :complete_description, :wait, :complete_description
              event :continue_line, :wait, :append_to_current_line
              event :codeblock, :codeblock, :write_codeblock
              event :pause, :pause
              event :skip_line, :skip_line
              event :start_list, :evaluate_list_item, :complete_description
            end
            
            event :complete, :end, :complete_description
          end
          
          state :codeblock do
            on_entry :evaluate_codeblock
            event :next_line, :codeblock
            event :complete_codeblock, :parsing_description, :complete_codeblock
            event :complete, :end, :complete_codeblock
          end
          
          state :pause do
            on_entry :should_resume
            event :complete, :end, :complete_description
            event :resume, :skip_line
            default :pause
          end
          
          state :skip_line do
            event :next_line, :parsing_description
            event :complete, :end, :complete_description
          end
          
          state :list do
            event :complete_list, :end, :complete_list
            event :next_line, :evaluate_list_item
            event :complete, :wait, :complete_all_lists
          end
          
          state :evaluate_list_item do
            on_entry :evaluate_list_item
            event :add_line, :list, :add_list_item
            event :complete_nested_list, :evaluate_list_item, :complete_nested_list
            event :start_list, :list, :write_first_list_item
            event :complete_list, :parsing_description, :complete_all_lists
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
      @list_indent_levels = []
    end
    
    def props
      return @props
    end
    
    def should_resume(line)
      @statemachine.resume(line) if line.match(/\+\+/)
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
    
    def write_first_list_item(line)
      @list_indent_levels << new_indent_length(line)
      @props << "rdoc_list do"
      add_list_item(line)
    end
    
    def add_list_item(line)
      @props << "rdoc_list_item :text => '#{parse_comment_line(line)}'"
    end
    
    def complete_nested_list(line)
      @list_indent_levels.pop
      complete_list
    end
    
    def complete_list
      @props << "end"
    end
    
    def complete_all_lists
      @list_indent_levels.size.times { complete_list }
    end
    
    def complete_description
      @props << "#{@prefix}_description :text => '#{parse_comment_line(@current_line)}'" unless parse_comment_line(@current_line).empty?
      @current_line = ""
    end
    
    def write_codeblock(line)
      complete_description
      @props << "codeblock do"
    end
    
    # Quick look over there ->
    def evaluate_line(line)
      if line.match(/^=begin rdoc/)
        @statemachine.skip_line(line)
      elsif line.match(/^=begin/)
        @statemachine.pause(line)
      elsif line.match(/^=end/)
        @statemachine.skip_line(line)
      elsif line.match(/--/)
        @statemachine.pause(line)
      elsif list?(line)
        @statemachine.start_list(line)
      elsif parse_comment_line(line).empty?
        @statemachine.complete_description
      elsif codeblock?(line)
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
      if codeblock?(line)
        write_code(line) # Should change a state - not do anything.
      else
        @statemachine.complete_codeblock(line)
      end
    end
    
    def list?(line)
      line_without_initial_pound(line).match(/^\s*\d|^\s*\*/)
    end
    
    def codeblock?(line)
      line =~ /^#\s\s/ || line =~ /^#\t/
    end
    
    def evaluate_list_item(line)
      if need_to_start_list?
        @statemachine.start_list(line)
      elsif need_to_end_list?(line)
        @statemachine.complete_list(line)
      elsif need_to_nest?(line)
        @statemachine.start_list(line)
      elsif need_to_complete_nest?(line)
        @statemachine.complete_nested_list(line)
      else
        @statemachine.add_line(line)
      end
    end
    
    def evaluate_nested_list_item(line)
      if !need_to_nest?(line)
        @statemachine.complete_list(line)
      else
        @statemachine.add_line(line)
      end
    end
    
    def need_to_start_list?
      return true if current_indent_level.nil?
    end
    
    def need_to_end_list?(line)
      return !list?(line)
    end
    
    def need_to_nest?(line)
      return new_indent_length(line) > current_indent_level
    end
    
    def need_to_complete_nest?(line)
      return new_indent_length(line) < current_indent_level
    end
    
    def new_indent_length(line)
      return line_without_initial_pound(line).length - line_without_initial_pound(line).lstrip.length
    end
    
    def current_indent_level
      @list_indent_levels.last
    end
  end
end