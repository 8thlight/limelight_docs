require File.dirname(__FILE__) + '/spec_helper'
require "toc_section"

describe TocSection do
  
  describe "all" do
    it "should have one section with empty links" do
      TocSection.new({:name => "Section One", :links => [], :start_shrunk => true})
      TocSection.sections = [{:name => "Section One", :links => [], :start_shrunk => true}]

      TocSection.all[0].name.should == "Section One"
      TocSection.all[0].links.should == []
      TocSection.all[0].start_shrunk?.should == true
    end

    it "should return a walkthrough link based on id" do
      TocSection.sections = [:name => "Section One", :links => ["getting_started_walkthrough"]]

      first_link = TocSection.all[0].links[0]
      first_link.id.should == "getting_started_walkthrough"
      first_link.text.should == "Getting Started"
      first_link.slideshow.should == "getting_started"
      first_link.title.should == "Getting Started"  
    end
  end
  
  it "should should have a name" do
    TocSection.new(:name => "Some Name", :links => []).name.should == "Some Name"
  end
  
  
  it "should parse the real sections" do
    lambda{TocSection.all}.should_not raise_error
  end
end