require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'limelight_rdoc/constant_generator'
require 'limelight_rdoc/prop_string'

describe LimelightRDoc::ConstantGenerator do
  it "should generate the name and value for the constant" do
    constant = mock("Constant", :name => "Name", :comment => nil)
    props = LimelightRDoc::PropString.new
    generator = LimelightRDoc::ConstantGenerator.new(constant, props)
    
    generator.generate
    
    props.should == "rdoc_constant do\nrdoc_constant_name :text => 'Name'\nend\n"
  end
  
  it "should format the comment if it has one" do
    constant = mock("Constant", :name => "Name", :comment => "comment")
    props = LimelightRDoc::PropString.new
    generator = LimelightRDoc::ConstantGenerator.new(constant, props)
    
    LimelightRDoc::CommentFormatter.should_receive(:format).with("rdoc_constant", "comment").and_return(["rdoc_constant_description => blah"])
    generator.generate
    
    props.should == "rdoc_constant do\nrdoc_constant_name :text => 'Name'\nrdoc_constant_description => blah\nend\n"
  end
end
