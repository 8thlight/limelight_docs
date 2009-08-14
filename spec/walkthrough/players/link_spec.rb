require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'walkthrough/players/link'

class MockLink
  include Link
  
  def url
    "test url"
  end
end

describe "Link Player" do
  
  it "should call openURL on its url" do
    link = MockLink.new
    os = mock("Limelight OS")
    instance = mock("Limelight OS instance", :os => os)
    Java::limelight.Context.stub!(:instance).and_return(instance)

    os.should_receive(:openURL).with("test url")
    link.mouse_clicked(nil)
  end
end

