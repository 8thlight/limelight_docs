require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'limelight_rdoc/limelight_rdoc'
require 'output_observer'

describe "Limelight Docs Production" do

  uses_limelight :scene => "blah", :stage => "default"

  it "should load rdocs" do
    rdoc = mock("rdoc")
    limelight_rdoc = mock("LimelightRDoc")
    LimelightRDoc::LimelightRDoc.should_receive(:new).and_return(limelight_rdoc)
    limelight_rdoc.should_receive(:props_from).with($LIMELIGHT_LIB).and_return(rdoc)

    scene.should_receive(:show_activity).at_least(1)
    scene.should_receive(:enable_rdoc_tab)

    production.production_opened
    sleep(0.5)
    
    production.rdoc.should == rdoc
  end

end
