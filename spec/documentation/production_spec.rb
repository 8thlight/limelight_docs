require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'limelight_rdoc/limelight_rdoc'

describe "Production" do
  uses_scene :fake
  
  it "should have a stubbed rdoc accessor that is always an empty hash in test mode" do
    production.production_loaded 

    production.rdoc.should == {}
  end
  
  describe "With Limelight RDoc" do
    before(:each) do
      @limelight_rdoc = mock(LimelightRDoc::LimelightRDoc)
      LimelightRDoc::LimelightRDoc.stub!(:new).and_return(@limelight_rdoc)
    end

    it "should load the props from $LIMELIGHT_LIB on production_loaded" do
      @limelight_rdoc.should_receive(:props_from).with($LIMELIGHT_LIB).and_return(nil)

      production.production_loaded
    end

    it "should store the loaded props in rdoc" do
      @limelight_rdoc.stub!(:props_from).and_return("Type doesnt matter")

      production.production_loaded

      production.rdoc.should == "Type doesnt matter"
    end
  end
end