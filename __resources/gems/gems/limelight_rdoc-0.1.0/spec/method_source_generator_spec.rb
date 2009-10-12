require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'limelight_rdoc/method_source_generator'
require "rdoc/parser/ruby"

describe LimelightRDoc::MethodSourceGenerator do
  def token(klass, text)
    case klass
    when "TkCOMMENT"
      t = eval("RDoc::RubyToken::#{klass}").new(0, 0)
    when "TkNL"
      t = eval("RDoc::RubyToken::#{klass}").new(0, 0)
    when "TkSPACE"
      t = eval("RDoc::RubyToken::#{klass}").new(0, 0)
    when "TkIVAR"
      t = eval("RDoc::RubyToken::#{klass}").new(0, 0, 0)
    when "TkUNLESS_MOD"
      t = eval("RDoc::RubyToken::#{klass}").new(0, 0, 0)
    when "TkDEF"
      t = eval("RDoc::RubyToken::#{klass}").new(0, 0, 0)
    when "TkIDENTIFIER"
      t = eval("RDoc::RubyToken::#{klass}").new(0, 0, 0)
    else
      raise "Define test initializer for #{klass}"
    end
    t.text = text
    return t
  end
  
  before(:each) do
    @generator = LimelightRDoc::MethodSourceGenerator.new
  end
  
  it "should return no props for a nil token_stream" do
    @generator.convert(nil).should == []
  end
  
  it "should wrap the props in a block" do
    props = @generator.convert([])
    props[0].should == "method_source_codeblock do"
    props[-1].should == "end"
  end
  
  it "should convert the first line" do
    stream = [token("TkCOMMENT", "# File /some/file/path.rb, line 47"),
              token("TkNL", ""),
              token("TkSPACE", " "),
              token("TkDEF", "def"),
              token("TkSPACE", " "),
              token("TkIDENTIFIER", "scene")]
    
    @generator.convert(stream).should include("code :text => ' def scene'")
  end
  
  it "should convert the second line" do
    stream = [token("TkCOMMENT", "# File /some/file/path.rb, line 47"),
              token("TkNL", ""),
              token("TkSPACE", " "),
              token("TkDEF", "def"),
              token("TkSPACE", " "),
              token("TkIDENTIFIER", "scene"),
              token("TkNL", ""),
              token("TkSPACE", " "),      
              token("TkIDENTIFIER", "open_scene"),
              token("TkSPACE", " "),
              token("TkUNLESS_MOD", "unless"),
              token("TkSPACE", " "),
              token("TkIVAR", "@scene"),
              token("TkNL", "")]     # 
                            
    @generator.convert(stream).should include("code :text => ' def scene'")
    @generator.convert(stream).should include("code :text => ' open_scene unless @scene'")
  end




end


# RDoc::RubyToken::TkCOMMENT: # File /Users/ericmeyer/Projects/jruby-1.3.1/lib/ruby/gems/1.8/gems/limelight-0.4.0-java/lib/limelight/specs/spec_helper.rb, line 47
# RDoc::RubyToken::TkNL: 
# RDoc::RubyToken::TkSPACE:       
# RDoc::RubyToken::TkDEF: def
# RDoc::RubyToken::TkSPACE:  
# RDoc::RubyToken::TkIDENTIFIER: scene
# RDoc::RubyToken::TkNL: 
# RDoc::RubyToken::TkSPACE:         
# RDoc::RubyToken::TkIDENTIFIER: open_scene
# RDoc::RubyToken::TkSPACE:  
# RDoc::RubyToken::TkUNLESS_MOD: unless
# RDoc::RubyToken::TkSPACE:  
# RDoc::RubyToken::TkIVAR: @scene
# RDoc::RubyToken::TkNL: 
# RDoc::RubyToken::TkSPACE:         
# RDoc::RubyToken::TkRETURN: return
# RDoc::RubyToken::TkSPACE:  
# RDoc::RubyToken::TkIVAR: @scene
# RDoc::RubyToken::TkNL: 
# RDoc::RubyToken::TkSPACE:       
# RDoc::RubyToken::TkEND: end


# def markup_code
#  return '' unless @token_stream
# 
#  src = ""
# 
#  @token_stream.each do |t|
#    next unless t
#    #        style = STYLE_MAP[t.class]
#    style = case t
#            when RDoc::RubyToken::TkCONSTANT then "ruby-constant"
#            when RDoc::RubyToken::TkKW       then "ruby-keyword kw"
#            when RDoc::RubyToken::TkIVAR     then "ruby-ivar"
#            when RDoc::RubyToken::TkOp       then "ruby-operator"
#            when RDoc::RubyToken::TkId       then "ruby-identifier"
#            when RDoc::RubyToken::TkNode     then "ruby-node"
#            when RDoc::RubyToken::TkCOMMENT  then "ruby-comment cmt"
#            when RDoc::RubyToken::TkREGEXP   then "ruby-regexp re"
#            when RDoc::RubyToken::TkSTRING   then "ruby-value str"
#            when RDoc::RubyToken::TkVal      then "ruby-value"
#            else
#              nil
#            end
# 
#    text = CGI.escapeHTML(t.text)
# 
#    if style
#      src << "<span class=\"#{style}\">#{text}</span>"
#    else
#      src << text
#    end
#  end
# 
#  add_line_numbers src if RDoc::RDoc.current.options.include_line_numbers
# 
#  src
# end