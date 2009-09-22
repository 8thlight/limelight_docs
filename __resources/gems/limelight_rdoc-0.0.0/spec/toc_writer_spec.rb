require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'limelight_rdoc/toc_writer'

describe LimelightRDoc::TocWriter do
  
  it "should create a toc file" do
    file = mock(File, :write => nil)
    File.should_receive(:open).with("outputdir/toc.rb", "w+").and_yield(file)
    
    writer = LimelightRDoc::TocWriter.new([], "outputdir")
    writer.write
  end
  
  it "should write a toc entry for every class in the list" do
    file = mock(File, :write => nil)
    File.stub!(:open).and_yield(file)
    
    file.should_receive(:puts).with("toc_entry :text => 'MyClassName1', :class_prop_file => 'MyClassName1.rb'")
    file.should_receive(:puts).with("toc_entry :text => 'MyClassName2', :class_prop_file => 'MyClassName2.rb'")
    
    writer = LimelightRDoc::TocWriter.new([mock("RDoc::NormalClass", :name => "MyClassName1"), mock("RDoc::NormalClass", :name => "MyClassName2")], "outputdir")
    writer.write
  end
end