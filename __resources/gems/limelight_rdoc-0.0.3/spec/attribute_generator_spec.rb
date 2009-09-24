require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'limelight_rdoc/attribute_generator'
require 'limelight_rdoc/prop_string'

describe LimelightRDoc::AttributeGenerator do
  before(:each) do
    @attribute = mock("RDoc::Normal", :name => "name", :rw => "r", :comment => '')
    @props = LimelightRDoc::PropString.new
    @writer = LimelightRDoc::AttributeGenerator.new(@attribute, @props)
  end   
  
  it "should write out each attribute in a header" do
    @writer.write
     
    @props.should include("attribute_header do\nattribute_name :text => 'name'\nattribute_read_write :text => '[r]'\nend\n")
  end
   
  it "should write a description of the attribute" do
    LimelightRDoc::CommentFormatter.stub!(:format).with("attribute", anything()).and_return(["attribute_description1", "attribute_description2"])

    @writer.write
    
    @props.should match(/attribute_header do\n(.*\n)*attribute_description1\nattribute_description2\nend\n/)
  end
end