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
              event :next_line, :parsing_description, :set_current_line
            end

            state :parsing_description do
              on_entry :evaluate_line
              event :complete_description, :wait, :complete_description
              event :continue_line, :wait, :append_to_current_description
              event :codeblock, :codeblock, :write_codeblock
              event :pause, :pause
              event :skip_line, :skip_line
              event :write_heading, :write_heading, :complete_description
              event :start_list, :evaluate_list_item, :complete_description
            end

            state :write_heading do
              on_entry :write_heading
              event :done, :wait
            end
            
            event :complete, :end, :complete_description
          end
          
          state :codeblock do
            on_entry :evaluate_codeblock
            event :next_line, :codeblock, :set_current_line
            event :complete_codeblock, :parsing_description, :complete_codeblock
            event :complete, :end, :complete_codeblock
          end
          
          state :pause do
            on_entry :should_resume
            event :complete, :end, :complete_description
            event :resume, :skip_line
            default :pause, :set_current_line
          end
          
          state :skip_line do
            event :next_line, :parsing_description, :set_current_line
            event :complete, :end, :complete_description
          end
          
          state :list do
            event :complete_list, :end, :complete_list
            event :next_line, :evaluate_list_item, :set_current_line
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
    attr_reader :props
    
    def initialize
      @props = []
      @current_description = ""
      @list_indent_levels = []
    end
    
    # Quick look over there ->
    def evaluate_line
      if @current_line.match(/^=begin rdoc/)
        @statemachine.skip_line
      elsif @current_line.match(/^=begin/)
        @statemachine.pause
      elsif @current_line.match(/^=end/)
        @statemachine.skip_line
      elsif matches_skip_line?
        @statemachine.skip_line
      elsif @current_line.match(/--/)
        @statemachine.pause
      elsif @current_line.match(/^# = /)
        @statemachine.write_heading
      elsif @current_line.match(/^# ==/)
        @statemachine.write_heading
      elsif list?
        @statemachine.start_list
      elsif plain_text_from_comment.empty?
        @statemachine.complete_description
      elsif codeblock?
        @statemachine.codeblock
      else
        @statemachine.continue_line
      end
    end

    def matches_skip_line?
      @current_line.match(/^#- /) || @current_line.match(/^# ---/)
    end
        
    def append_to_current_description
      @current_description << " #{plain_text_from_comment}"
    end
        
    def complete_description
      @props << "#{@prefix}_description :text => '#{plain_text_from_comment(@current_description)}'" unless plain_text_from_comment(@current_description).empty?
      @current_description = ""
    end

    def write_heading
      heading = line_without_initial_pound.split[1]
      comment = line_without_initial_pound.split[2..-1].join(" ")
      @props << "rdoc_heading :text => '#{heading}'"
      @current_description << comment
      @statemachine.done
    end
    
    def should_resume
      @statemachine.resume if @current_line.match(/\+\+/)
    end
    
    def list?
      line_without_initial_pound.match(/^\s*\d|^\s*\*/)
    end
    
    def codeblock?
      @current_line.strip =~ /^#\s\s/ || @current_line.strip =~ /^#\t/
    end
    
    def evaluate_codeblock
      if codeblock?
        write_code # Should change a state - not do anything.
      else
        @statemachine.complete_codeblock
      end
    end
    
    def write_codeblock
      complete_description
      @props << "codeblock do"
    end
    
    def write_code
      @props << "code :text => '#{line_without_initial_pound}'"
    end
    
    def complete_codeblock
      @props << "end"
    end
    
    def evaluate_list_item
      if need_to_start_list?
        @statemachine.start_list
      elsif need_to_end_list?
        @statemachine.complete_list
      elsif need_to_nest?
        @statemachine.start_list
      elsif need_to_complete_nest?
        @statemachine.complete_nested_list
      else
        @statemachine.add_line
      end
    end
    
    def write_first_list_item
      @list_indent_levels << new_indent_length
      @props << "rdoc_list do"
      add_list_item
    end
    
    def add_list_item
      @props << "rdoc_list_item :text => '#{plain_text_from_comment}'"
    end
        
    def complete_list
      @props << "end"
    end
    
    def complete_all_lists
      @list_indent_levels.size.times { complete_list }
    end

    def complete_nested_list
      @list_indent_levels.pop
      complete_list
    end
    
    def need_to_start_list?
      return true if current_indent_level.nil?
    end
    
    def need_to_end_list?
      return !list?
    end
    
    def need_to_nest?
      return new_indent_length > current_indent_level
    end
    
    def need_to_complete_nest?
      return new_indent_length < current_indent_level
    end
    
    def new_indent_length
      return line_without_initial_pound.length - line_without_initial_pound.lstrip.length
    end
    
    def set_current_line(line)
      @current_line = line
    end
    
    private ###############################################
    
    def current_indent_level
      @list_indent_levels.last
    end
    
    def plain_text_from_comment(line = @current_line)
      line_without_initial_pound(line).strip
    end
    
    def line_without_initial_pound(line = @current_line)
      return line.gsub(/^\s*#/, '')
    end
  end
end
