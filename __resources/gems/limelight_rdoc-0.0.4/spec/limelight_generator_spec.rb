require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'limelight_rdoc/limelight_generator'

describe RDoc::Generator::Limelight do
  Options = Struct.new(:op_dir)
  
  before(:each) do
    @all_classes_and_modules = [mock(RDoc::Context, :full_name => "AA::FullClassName")]
    RDoc::TopLevel.stub!(:all_classes_and_modules).and_return(@all_classes_and_modules)
    
    @options = Options.new(File.expand_path(File.dirname(__FILE__)) + "/doc")
    @generator = RDoc::Generator::Limelight.for(@options)
    @null_writer = mock("writer", :write => nil, :props => [])
  end
  
  it "should return nil for the class_dir" do
    @generator.class_dir.should be_nil
  end
  
  it "should return nil for the file dir" do
    @generator.file_dir.should be_nil
  end

  describe "Class Generation" do
    before(:each) do
      @class_writer = mock(LimelightRDoc::ClassFileGenerator, :props => [])
    end
    
    it "should generate a class for each module" do
      @all_classes_and_modules = [mock(RDoc::Context, :full_name => "one"), mock(RDoc::Context, :full_name => "two")]
      RDoc::TopLevel.stub!(:all_classes_and_modules).and_return(@all_classes_and_modules)
      
      LimelightRDoc::ClassFileGenerator.should_receive(:new).with(@all_classes_and_modules[0]).and_return(@null_writer)
      LimelightRDoc::ClassFileGenerator.should_receive(:new).with(@all_classes_and_modules[1]).and_return(@null_writer)
      
      @generator.generate
    end
    
    it "should generate all the class files" do
      LimelightRDoc::ClassFileGenerator.should_receive(:new).with(@all_classes_and_modules[0]).and_return(@class_writer)
      @class_writer.should_receive(:write)
    
      @generator.generate
    end
    
    it "should add the class to the props" do
      writer = mock(LimelightRDoc::ClassFileGenerator, :write => nil)
      LimelightRDoc::ClassFileGenerator.stub!(:new).and_return(writer)
      writer.stub!(:props).and_return("Hey there")
      
      @generator.generate
      
      @generator.props.should == {"AA::FullClassName" => "Hey there"}
    end
  
  end
end