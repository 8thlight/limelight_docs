require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'limelight_rdoc/limelight_generator'

describe RDoc::Generator::Limelight do
  Options = Struct.new(:op_dir)
  
  before(:each) do
    @all_classes_and_modules = ["Normal Class"]      
    RDoc::TopLevel.stub!(:all_classes_and_modules).and_return(@all_classes_and_modules)
    
    @options = Options.new(File.expand_path(File.dirname(__FILE__)) + "/doc")
    @generator = RDoc::Generator::Limelight.for(@options)
    @null_writer = mock("writer", :write => nil)
  end
  
  describe "Toc generation" do
    before(:each) do
      LimelightRDoc::ClassFileWriter.stub!(:new).and_return(@null_writer)
    end
    
    it "should generate a table of contents file" do
      writer = mock(LimelightRDoc::TocWriter)

      LimelightRDoc::TocWriter.should_receive(:new).with(@all_classes_and_modules, @options.op_dir).and_return(writer)
      writer.should_receive(:write)

      @generator.generate([RDoc::TopLevel.new("")])
    end
  end
  
  describe "Class Generation" do
    before(:each) do
      LimelightRDoc::TocWriter.stub!(:new).and_return(@null_writer)
    end
    
    it "should generate a class for each module" do
      @all_classes_and_modules = ["one", "two"]
      RDoc::TopLevel.stub!(:all_classes_and_modules).and_return(@all_classes_and_modules)
      
      LimelightRDoc::ClassFileWriter.should_receive(:new).with(@all_classes_and_modules[0], @options.op_dir).and_return(@null_writer)
      LimelightRDoc::ClassFileWriter.should_receive(:new).with(@all_classes_and_modules[1], @options.op_dir).and_return(@null_writer)
      
      @generator.generate([])
    end
    
    it "should generate all the class files" do
      writer = mock(LimelightRDoc::ClassFileWriter)
    
      LimelightRDoc::ClassFileWriter.should_receive(:new).with(@all_classes_and_modules[0], @options.op_dir).and_return(writer)
      writer.should_receive(:write)
    
      @generator.generate([])
    end
  
  end
end