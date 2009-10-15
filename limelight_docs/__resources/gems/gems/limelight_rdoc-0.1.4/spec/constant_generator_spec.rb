require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'limelight_rdoc/constant_generator'
require 'limelight_rdoc/prop_string'

describe LimelightRDoc::ConstantGenerator do
  it "should generate the name and value for the constant" do
    constant = mock("Constant", :name => "Name", :value => "Value")
    props = LimelightRDoc::PropString.new
    generator = LimelightRDoc::ConstantGenerator.new(constant, props)
    
    generator.generate
    
    props.should == "rdoc_constant_name :text => 'Name'\nrdoc_constant_value :text => 'Value'\n"
  end
end
