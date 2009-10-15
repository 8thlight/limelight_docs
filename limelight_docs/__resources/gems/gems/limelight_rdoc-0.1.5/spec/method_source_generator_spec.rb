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
  
  it "should escape single quotes in the code" do
    stream = [token("TkCOMMENT", "# File /some/file/path.rb, line 47"),
              token("TkNL", ""),
              token("TkSPACE", " "),
              token("TkDEF", "def"),
              token("TkSPACE", " "),
              token("TkIDENTIFIER", "scene"),
              token("TkNL", ""),
              token("TkSPACE", " "),      
              token("TkIDENTIFIER", "puts 'test'"),
              token("TkNL", "")]

    @generator.convert(stream).should include("code :text => ' puts \\'test\\''")
  end
  
  it "should escape single quotes in the code if its the last line" do
    stream = [token("TkCOMMENT", "# File /some/file/path.rb, line 47"),
              token("TkNL", ""),
              token("TkSPACE", " "),
              token("TkDEF", "def"),
              token("TkSPACE", " "),
              token("TkIDENTIFIER", "scene"),
              token("TkNL", ""),
              token("TkSPACE", " "),      
              token("TkIDENTIFIER", "puts 'test'")]

    @generator.convert(stream).should include("code :text => ' puts \\'test\\''")    
  end
end