require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'limelight_rdoc/limelight_rdoc'

describe LimelightRDoc do
  
  before(:each) do
    @rdoc = mock(RDoc)
    RDoc::RDoc.stub!(:new).and_return(@rdoc)
  end
  
  it "should generate with the limelight formatter" do  
    @rdoc.should_receive(:document).with(["--fmt=limelight"])
    
    LimelightRDoc.document
  end
  
  it "should include the passed in arguments as well" do
    @rdoc.should_receive(:document).with(["--fmt=limelight", "-o=./doc", "directoryName"])
    
    LimelightRDoc.document(["-o=./doc", "directoryName"])
  end
  
end