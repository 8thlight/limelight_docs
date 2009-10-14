require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'limelight_rdoc/limelight_rdoc'

describe "Limelight Docs Production" do

  uses_limelight :scene => "blah", :stage => "default"

  it "should load rdocs" do
    rdoc = mock("rdoc")
    limelight_rdoc = mock("LimelightRDoc")
    LimelightRDoc::LimelightRDoc.should_receive(:new).and_return(limelight_rdoc)
    limelight_rdoc.should_receive(:props_from).with($LIMELIGHT_LIB).and_return(rdoc)
    
    production.production_opened
    sleep(0.1)
    
    production.rdoc.should == rdoc
  end

end
