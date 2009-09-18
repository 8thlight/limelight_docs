require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'limelight_rdoc/class_file_writer'

describe LimelightRDoc::ClassFileWriter do  
  
  before(:each) do
    @rdoc_class = mock("RDoc::NormalClass", :name => 'MyClassName', :each_method => nil)
    @outputdir = "Fake Directory"
    @writer = LimelightRDoc::ClassFileWriter.new(@rdoc_class, @outputdir)
    
    @file = mock(File, :puts => nil)
    File.stub!(:open).and_yield(@file)
  end
  

  it "should write a file for the passed in class" do
    File.should_receive(:open).with(File.join(@outputdir, "MyClassName.rb"), "w+").and_yield(@file)

    @writer.write
  end  
  
  it "should write a class prop for that class" do
    @file.should_receive(:puts).with("class_name :text => 'MyClassName'")

    @writer.write
  end
  
  it "should list the methods underneath the class name" do
    method = mock("RDoc::AnyMethod", :name => 'method_name')
    @rdoc_class.stub!(:each_method).and_yield(method)
      
    @file.should_receive(:puts).with("method_name :text => 'method_name'")
  
    @writer.write
  end
end