require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'output_observer'

describe OutputObserver do
  before(:each) do
    @observer = OutputObserver.new
    @lines = []
    @observer.action = Proc.new { |line| @lines << line }
  end

#  it "should infiltrate" do
#    @observer.infiltrate!
#    $stdout.should be(@observer)
#
#    @observer.retreat!
#    $stdout.should be(STDOUT)
#  end

  it "should capture output without newline" do
    @observer.print "hello"

    @observer.buffer.should == "hello"
    @lines.should == []
  end

  it "should report lines" do
    @observer.print "hello"
    @observer.print("\n")

    @observer.buffer.should == ""
    @lines.should == ["hello"]
  end

  it "should report lines with puts" do
    @observer.puts "Howdy"

    @lines.should == ["Howdy"]
    @observer.buffer.should == ""
  end

  it "should report leftovers" do
    @observer.print("nice meal\nleft over")
    @lines.should == ["nice meal"]
    @observer.buffer.should == "left over"

    @observer.retreat!
    @lines.should == ["nice meal", "left over"]
    @observer.buffer.should == ""
  end

  
end