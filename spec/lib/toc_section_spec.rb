require File.dirname(__FILE__) + '/spec_helper'
require "toc_section"

describe TocSection do
  
  describe "all" do
    it "should have one section with empty links" do
      TocSection.new({:name => "Section One", :links => []})
      TocSection.sections = [{:name => "Section One", :links => []}]

      TocSection.all[0].name.should == "Section One"
      TocSection.all[0].links.should == []      
    end

    it "should return a link" do
      link = {:id => "some id", :text => "some text", :slideshow => "some slideshow", :title => "Some Title"}

      TocSection.sections = [:name => "Section One", :links => [link]]

      first_link = TocSection.all[0].links[0]
      first_link.id.should == "some id"
      first_link.text.should == "some text"
      first_link.slideshow.should == "some slideshow"
      first_link.title.should == "Some Title"    
    end
  end
  
  it "should should have a name" do
    TocSection.new(:name => "Some Name", :links => []).name.should == "Some Name"
  end
  
end