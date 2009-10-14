module LimelightRDoc
  class MethodSourceGenerator
    def convert(token_stream)
      return [] if token_stream.nil?
      props = ["method_source_codeblock do"]
      prop_string = ""
      token_stream.collect do |token|
        prop_string << token.text unless token.class == RDoc::RubyToken::TkCOMMENT
        if token.class == RDoc::RubyToken::TkNL
          props << "code :text => '#{prop_string}'"
          prop_string = ""
        end
      end
      props << "code :text => '#{prop_string}'"
      props << "end"
      return props
    end
  end
end