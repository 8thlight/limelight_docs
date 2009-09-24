require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'limelight_rdoc/limelight_rdoc'

describe LimelightRDoc::LimelightRDoc do
  
  before(:each) do
    @rdoc = mock(RDoc)
    RDoc::RDoc.stub!(:new).and_return(@rdoc)
  end
  
  describe "Getting Docs in Memory" do
    before(:each) do
      @rdoc = mock(RDoc::RDoc, :parse_files => nil, :options= => nil)  
      RDoc::RDoc.stub!(:new).and_return(@rdoc)
      
      @options = mock(RDoc::Options, :parse => nil)
      RDoc::Options.stub!(:new).and_return(@options)
      
      @generator = mock(RDoc::Generator::Limelight, :generate => nil, :props => [])
      RDoc::Generator::Limelight.stub!(:new).and_return(@generator)
      @ll_doc = LimelightRDoc::LimelightRDoc.new
    end
    
    it "should setup the rdoc options" do
      @options.should_receive(:parse).with(["--fmt=limelight", "MyDirectory"])
      
      @ll_doc.props_from("MyDirectory")
    end
        
    it "should create a new RDoc instance, and parse the contents" do
      @rdoc.should_receive(:options=).with(@options).ordered
      @rdoc.should_receive(:parse_files).ordered

      @ll_doc.props_from("/I/am/not/likely/to/be/on/your/machine").should be_empty
    end
    
    it "should then call generate on its generator" do
      @generator.should_receive(:generate)
      
      @ll_doc.props_from("/I/am/not/likely/to/be/on/your/machine")
    end
    
    it "should return the value after generating" do
      @generator.should_receive(:generate).ordered
      @generator.should_receive(:props).ordered.and_return("blah")
      
      @ll_doc.props_from("/I/am/not/likely/to/be/on/your/machine").should == "blah"
    end
    
    it "should clear the top level before parsing each time" do
      RDoc::TopLevel.should_receive(:reset).ordered
      @rdoc.should_receive(:parse_files).ordered
      
      @ll_doc.props_from("MyDirectory")
    end
  end
  
  describe "Generating Doc Files" do
    before(:each) do
      @limelight_rdoc = mock(LimelightRDoc::LimelightRDoc, :props_from => {})
      LimelightRDoc::LimelightRDoc.stub!(:new).and_return(@limelight_rdoc)
      @file = mock(File, :write => nil)
      File.stub!(:open).and_yield(@file)
      File.stub!(:expand_path).with("output_directory").and_return("output_directory")
    end
    
    it "should get the in memory props from the right directory" do
      @limelight_rdoc.should_receive(:props_from).with("directory")
      LimelightRDoc::LimelightRDoc.document("directory", "output_directory")
    end
    
    it "should remove the output directory, then create it" do
      FileUtils.should_receive(:rm_rf).with("output_directory").ordered
      FileUtils.should_receive(:mkdir).with("output_directory").ordered
      
      LimelightRDoc::LimelightRDoc.document("directory", "output_directory")
    end
    
    it "should write each prop dsl to a class based on the class name" do
      @limelight_rdoc.stub!(:props_from).and_return("Classname" => "Prop DSL")
      
      File.should_receive(:open).with("output_directory/Classname.rb", "w+").and_yield(@file)
      @file.should_receive(:write).with("Prop DSL")
      
      LimelightRDoc::LimelightRDoc.document("directory", "output_directory")
    end
    
    it "should write all the props" do
      @limelight_rdoc.stub!(:props_from).and_return({"Classname" => "Prop DSL", "Classname2" => "Prop DSL"})
      
      File.should_receive(:open).with("output_directory/Classname.rb", "w+")
      File.should_receive(:open).with("output_directory/Classname2.rb", "w+")
      
      LimelightRDoc::LimelightRDoc.document("directory", "output_directory")
    end
    
    it "should expand the output dir" do
      File.stub!(:expand_path).with("output_directory").and_return("mydirectory/output_directory")
      @limelight_rdoc.stub!(:props_from).and_return("Classname" => "Prop DSL")
      
      File.should_receive(:open).with("mydirectory/output_directory/Classname.rb", "w+")
      
      LimelightRDoc::LimelightRDoc.document("directory", "output_directory")
    end
    
  end
end