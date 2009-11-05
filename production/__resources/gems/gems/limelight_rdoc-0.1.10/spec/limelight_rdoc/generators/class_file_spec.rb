require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'limelight_rdoc/generators/class_file'

describe LimelightRDoc::Generators::ClassFile do
  
  before(:each) do
    @rdoc_class = mock("RDoc::NormalClass", :name => "MyClassName", :full_name => 'Limelight::MyClassName', 
                                            :comment => "# The stupid class for Eric the younger", 
                                            :each_method => nil, :each_attribute => nil, :attributes => [],
                                            :method_list => [], :constants => [], :module? => false)
                                            
    @writer = LimelightRDoc::Generators::ClassFile.new(@rdoc_class)
  end
  
  
  it "should return the props written" do
    @writer.write
      
    @writer.props.should == "rdoc_class_name :text => 'Limelight::MyClassName'\nclass_description :text => 'The stupid class for Eric the younger'\n"
  end
  
  it "should write a module" do
    @rdoc_class.stub!(:module?).and_return(true)
    @writer.write
      
    @writer.props.should == "rdoc_module_name :text => 'Limelight::MyClassName'\nclass_description :text => 'The stupid class for Eric the younger'\n"
  end

  it "should not generate the method writer if there are no methods in method_list" do
    LimelightRDoc::Generators::Method.should_not_receive(:new)
  end
  
  
  describe "Method generation" do
    before(:each) do
      @method = mock("RDoc::AnyMethod", :name => 'method_name', :comment => "# Comment is here", :params => "(block, params)", :token_stream => [])
      @rdoc_class.stub!(:each_method).and_yield(@method)
      @rdoc_class.stub!(:method_list).and_return([@method])
      LimelightRDoc::CommentFormatter.stub!(:format).and_return([])
    end
    
    it "should generate the public method prop if there are any" do
      @writer.write
      
      @writer.props.should include("public_methods_header :text => 'Public Methods'")
    end
        
    it "should use the method writer to make the method" do
      method_writer = mock(LimelightRDoc::Generators::Method)
      LimelightRDoc::Generators::Method.should_receive(:new).with(@method, "rdoc_class_name :text => 'Limelight::MyClassName'\npublic_methods_header :text => 'Public Methods'\n").and_return(method_writer)
      method_writer.should_receive(:write)
      
      @writer.write
    end
  end
  
  describe "Attribute Generation" do
    before(:each) do
      @rdoc_class.stub!(:attributes).and_return([1])
      @attribute = mock("Attribute", :name => "name", :rw => "r", :comment => '')
      @rdoc_class.stub!(:each_attribute).and_yield(@attribute)
      LimelightRDoc::CommentFormatter.stub!(:format).and_return([])
    end
    
    it "should not write out the attributes if there are none" do
      @rdoc_class.stub!(:attributes).and_return([])
      LimelightRDoc::Generators::Attribute.should_not_receive(:new)
      
      @writer.write
      
      @writer.props.should_not include("attributes_header :text => 'Attributes'")
    end
    
    it "should write the attributes header and attributes do/end block if there are attributes" do
      @writer.write
      
      @writer.props.should match(/attributes_header :text => 'Attributes'\nattributes do\n(.*\n)*end\n/)
    end
    
    it "should should write out the Attribute Generator if there are attributes" do
      attribute_gen = mock(LimelightRDoc::Generators::Attribute)
      LimelightRDoc::Generators::Attribute.should_receive(:new).with(@attribute, "rdoc_class_name :text => 'Limelight::MyClassName'\nattributes_header :text => 'Attributes'\nattributes do\n").and_return(attribute_gen)
      attribute_gen.should_receive(:write)
      
      @writer.write
    end
  end
  
  describe "Constant Generation" do
    before(:each) do
      @rdoc_class.stub!(:constants).and_return([@constant])
      @rdoc_class.stub!(:each_constant).and_yield(nil)
      LimelightRDoc::Generators::Constant.stub!(:new).and_return(mock(:null_object => true))
    end
    
    it "should write the rdoc_constants_header do/end block if there are constants" do
      @writer.write
      
      @writer.props.should match(/rdoc_constant_header :text => 'Constants'\nrdoc_constants do\n(.*\n)*end\n/)
    end
    
    it "should not write the rdoc_constants_hader or rdoc_constatns if there are not constatns" do
      @rdoc_class.stub!(:constants).and_return([])

      @writer.write
      
      @writer.props.should_not include("rdoc_constant_header")
      @writer.props.should_not include("rdoc_constants")
    end
    
    it "should use the ConstantGenerator on each constant" do
      constant = mock("Constant")
      @rdoc_class.stub!(:each_constant).and_yield(constant)
      
expected_text =<<END
rdoc_class_name :text => 'Limelight::MyClassName'
class_description :text => 'The stupid class for Eric the younger'
rdoc_constant_header :text => 'Constants'
rdoc_constants do
END
      
      constant_generator = mock(LimelightRDoc::Generators::Constant)
      LimelightRDoc::Generators::Constant.should_receive(:new).with(constant, expected_text).and_return(constant_generator)
      constant_generator.should_receive(:generate)
      
      @writer.write
    end
  end
end