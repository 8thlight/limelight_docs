require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'limelight_rdoc/generators/method'
require 'limelight_rdoc/prop_string'

describe LimelightRDoc::Generators::Method do
  before(:each) do
    @method = mock("RDoc::AnyMethod", :name => 'method_name', :comment => "# Comment is here", :params => "(block, params)", :token_stream => [])
    @props = LimelightRDoc::PropString.new
    
    LimelightRDoc::CommentFormatter.stub!(:format).and_return([])
    @writer = LimelightRDoc::Generators::Method.new(@method, @props)
    
    @source_generator = mock(LimelightRDoc::Generators::MethodSource, :convert => [])
    LimelightRDoc::Generators::MethodSource.stub!(:new).and_return(@source_generator)
  end
    
  it "should list the methods underneath the class name in a method block" do
    @writer.write
    
    @props.should match(/method do\n(.*\n)*end/)
  end
      
  it "should write all the returned values from the MethodFormatter for classes" do
    LimelightRDoc::CommentFormatter.stub!(:format).with("method", @method.comment).and_return(["write_me", "and_me"])

    @writer.write
    
    @props.should match(/method do\n(.*\n)*write_me\nand_me\n(.*\n)*end/)
  end
  
  it "should write the method name with its parameters" do
    @writer.write
    
    @props.should include("method_header do\nmethod_name :text => 'method_name'\nmethod_parameters :text => '(block, params)'\nend\n")
  end
  
  it "should convert the method's source" do
    token_stream = mock('token_stream')
    @method.stub!(:token_stream).and_return(token_stream)
    @source_generator.should_receive(:convert).and_return([])
    
    @writer.write
  end
  
  it "should write the result of the source conversion" do
    @source_generator.stub!(:convert).and_return(["line one", "line two"])
    
    @writer.write
    
    @props.should match(/line one\n/)
    @props.should match(/line two\n/)
  end
  
  it "should have a prop to toggle the source" do
    @writer.write
    
    @props.should match(/toggle_source :text => 'Show Source'/)
  end
  
  it "should wrap the toggle_source prop" do
    @writer.write
    
    @props.should match(/source do\ntoggle_source :text => 'Show Source'\nend/)
  end
end