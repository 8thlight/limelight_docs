require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "Shrinkable" do
  uses_limelight :scene_path => "documentation" do
    shrinkable :id => "shrinkable", :height => 'auto'
  end

  def shrinkable
    return scene.find(:shrinkable)
  end

  before(:each) do
    shrinkable.casted
  end

  it "should grow the height and width back to where they started" do
    shrinkable.grow

    shrinkable.style.height.should == 'auto'
  end

  it "should shrink the height and width to zero on shrink" do
    shrinkable.grow
    shrinkable.shrink

    shrinkable.style.height.should == '0'
  end

  it "should return shrunk as true when both height & width are 0" do
    shrinkable.style.height = '0'
    shrinkable.should be_shrunk
  end

  it "should start things shrunk" do
    shrinkable.should be_shrunk
  end
end