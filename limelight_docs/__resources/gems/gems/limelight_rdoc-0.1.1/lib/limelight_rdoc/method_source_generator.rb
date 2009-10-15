module LimelightRDoc
  class MethodSourceGenerator
    def convert(token_stream)
      return [] if token_stream.nil?
      @props = ["method_source_codeblock do"]
      prop_string = ""
      token_stream.each do |token|
        prop_string << token.text unless token.class == RDoc::RubyToken::TkCOMMENT || token.class == RDoc::RubyToken::TkNL
        if token.class == RDoc::RubyToken::TkNL
          write_code_line(prop_string)
          prop_string = ""
        end
      end
      write_code_line(prop_string)
      @props << "end"
      return @props
    end
    
    def write_code_line(line)
      prop_string = line.gsub(/'/, "\\\\'")
      @props << "code :text => '#{prop_string}'"
    end
  end
end