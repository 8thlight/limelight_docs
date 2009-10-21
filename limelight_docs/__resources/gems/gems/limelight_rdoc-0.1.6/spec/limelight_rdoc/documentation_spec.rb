require File.dirname(__FILE__) + '/../spec_helper'
require "limelight_rdoc/documentation"

describe LimelightRDoc::Documentation do

  before(:each) do
    @rdoc_context = mock_rdoc_context("MatchingClass")
    RDoc::TopLevel.stub!(:all_classes_and_modules).and_return([@rdoc_context])
    @documentation = LimelightRDoc::Documentation.new
  end
  
  it "should return no classes on an empty search" do
    @documentation.search("").classes.should == []
  end
  
  it "should return a matching class" do
    @documentation.search("MatchingClass").classes.size.should == 1
    @documentation.search("MatchingClass").classes[0].full_name.should == "MatchingClass"
  end
  
  it "should not return a non matching class" do
    @documentation.search("No Matches").classes.should be_empty
  end
  
  it "should return partial matches" do
    @documentation.search("Match").classes.size.should == 1
    @documentation.search("Match").classes[0].full_name.should == "MatchingClass"
  end
  
  it "should return multiple matches" do
    RDoc::TopLevel.stub!(:all_classes_and_modules).and_return([@rdoc_context, mock_rdoc_context("MatchingClassThatIsCool")])
    
    @documentation.search("Match").classes.size.should == 2
    @documentation.search("Match").classes[0].full_name.should == "MatchingClass"
    @documentation.search("Match").classes[1].full_name.should == "MatchingClassThatIsCool"
  end
  
  it "should be case insensitive" do
    @documentation.search("match").classes.size.should == 1
    @documentation.search("match").classes[0].full_name.should == "MatchingClass"
  end

  it "should not return classes that are not be documented" do
    RDoc::TopLevel.stub!(:all_classes_and_modules).and_return([mock_rdoc_context("AlmostAMatch", false)])
    @documentation.search("AlmostAMatch").classes.should be_empty
  end
  
  it "should return matches in the middle" do
    RDoc::TopLevel.stub!(:all_classes_and_modules).and_return([mock_rdoc_context("Module::Malcom::Classname")])
    
    @documentation.search("Malcom").classes.size.should == 1
    @documentation.search("Malcom").classes[0].full_name.should == "Module::Malcom::Classname"
  end

  def mock_rdoc_context(full_name, document_self=true)
    mock("RDoc Context", :full_name => full_name, :document_self => document_self)
  end
end