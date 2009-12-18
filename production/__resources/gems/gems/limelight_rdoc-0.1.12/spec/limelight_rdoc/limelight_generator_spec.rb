require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'limelight_rdoc/limelight_generator'

describe RDoc::Generator::Limelight do
  Options = Struct.new(:op_dir)
  
  before(:each) do
    @all_classes_and_modules = [mock(RDoc::Context, :full_name => "AA::FullClassName", :document_self => true)]
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
      @class_writer = mock(LimelightRDoc::Generators::ClassFile, :props => [])
    end
    
    it "should generate a class for each module" do
      @all_classes_and_modules = [mock(RDoc::Context, :full_name => "one", :document_self => true), mock(RDoc::Context, :full_name => "two", :document_self => true)]
      RDoc::TopLevel.stub!(:all_classes_and_modules).and_return(@all_classes_and_modules)
      
      LimelightRDoc::Generators::ClassFile.should_receive(:new).with(@all_classes_and_modules[0]).and_return(@null_writer)
      LimelightRDoc::Generators::ClassFile.should_receive(:new).with(@all_classes_and_modules[1]).and_return(@null_writer)
      
      @generator.generate
    end
    
    it "should generate all the class files" do
      LimelightRDoc::Generators::ClassFile.should_receive(:new).with(@all_classes_and_modules[0]).and_return(@class_writer)
      @class_writer.should_receive(:write)
    
      @generator.generate
    end
    
    it "should add the class to the props" do
      writer = mock(LimelightRDoc::Generators::ClassFile, :write => nil)
      LimelightRDoc::Generators::ClassFile.stub!(:new).and_return(writer)
      writer.stub!(:props).and_return("Hey there")
      
      @generator.generate
      
      @generator.props['AA::FullClassName'].should == "Hey there"
    end

    it "appends to the key if more than one context has the same name" do
      @all_classes_and_modules = [mock(RDoc::Context, :full_name => "AA::FullClassName", :document_self => true),
                                  mock(RDoc::Context, :full_name => "AA::FullClassName", :document_self => true)]
      RDoc::TopLevel.stub!(:all_classes_and_modules).and_return(@all_classes_and_modules)
      writer = mock(LimelightRDoc::Generators::ClassFile, :write => nil)
      LimelightRDoc::Generators::ClassFile.stub!(:new).and_return(writer)
      writer.stub!(:props).and_return("Props ")

      @generator.generate

      @generator.props['AA::FullClassName'].should == "Props Props "
    end
    
    it "should not generate props for undocumented classes" do
      @all_classes_and_modules = [mock(RDoc::Context, :full_name => "one", :document_self => false)]
      RDoc::TopLevel.stub!(:all_classes_and_modules).and_return(@all_classes_and_modules)
      
      writer = mock(LimelightRDoc::Generators::ClassFile, :write => nil, :props => "I am a prop you should not see")
      LimelightRDoc::Generators::ClassFile.stub!(:new).and_return(writer)
      
      @generator.generate
      
      @generator.props.should be_empty
    end
  end
end
