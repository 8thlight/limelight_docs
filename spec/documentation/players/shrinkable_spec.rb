require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'documentation/players/shrinkable'

describe "Shrinkable" do
  uses_player :shrinkable
  
  before(:each) do
    player.casted
  end
  
  it "should grow the height and width back to where they started" do
    player.grow
    
    player.style.height.should == 'auto'
  end
  
  it "should shrink the height and width to zero on shrink" do
    player.grow
    player.shrink
    
    player.style.height.should == '0'
  end
      
  it "should return shrunk as true when both height & width are 0" do
    player.style.height = '0'
    player.should be_shrunk
  end
  
  it "should start things shrunk" do
    player.should be_shrunk
  end
end