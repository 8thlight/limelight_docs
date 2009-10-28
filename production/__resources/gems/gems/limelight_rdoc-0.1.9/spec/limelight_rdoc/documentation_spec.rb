require File.dirname(__FILE__) + '/../spec_helper'
require "limelight_rdoc/documentation"

describe LimelightRDoc::Documentation do

  before(:each) do
    @rdoc_context = mock_rdoc_class("MatchingClass")
    RDoc::TopLevel.stub!(:all_classes_and_modules).and_return([@rdoc_context])
    @documentation = LimelightRDoc::Documentation.new
  end
  
  it "should handle regexp errors" do
    match = @documentation.search('\\')
    match.classes.should == []
    match.found_methods.should == []
    match.comments.should == []
  end
  
  describe "classes" do
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
      RDoc::TopLevel.stub!(:all_classes_and_modules).and_return([@rdoc_context, mock_rdoc_class("MatchingClassThatIsCool")])
    
      @documentation.search("Match").classes.size.should == 2
      @documentation.search("Match").classes[0].full_name.should == "MatchingClass"
      @documentation.search("Match").classes[1].full_name.should == "MatchingClassThatIsCool"
    end
  
    it "should be case insensitive" do
      @documentation.search("match").classes.size.should == 1
      @documentation.search("match").classes[0].full_name.should == "MatchingClass"
    end

    it "should not return classes that are not be documented" do
      RDoc::TopLevel.stub!(:all_classes_and_modules).and_return([mock_rdoc_class("AlmostAMatch", false)])
      @documentation.search("AlmostAMatch").classes.should be_empty
    end
  
    it "should return matches in the middle" do
      RDoc::TopLevel.stub!(:all_classes_and_modules).and_return([mock_rdoc_class("Module::Malcom::Classname")])
    
      @documentation.search("Malcom").classes.size.should == 1
      @documentation.search("Malcom").classes[0].full_name.should == "Module::Malcom::Classname"
    end
  end
  
  describe "method_list" do
    before(:each) do
      @rdoc_context = mock_rdoc_class("Classname")
      @rdoc_context.stub!(:method_list).and_return([mock_rdoc_method("MethodOne")])
      RDoc::TopLevel.stub!(:all_classes_and_modules).and_return([@rdoc_context])
    end
    
    it "should return no methods on an empty string" do
      @documentation.search("").found_methods.should == []
    end
    
    it "should return one method on one class" do
      found_methods = @documentation.search("one").found_methods

      found_methods.size.should == 1
      found_methods[0].name.should == "MethodOne"
      found_methods[0].class_name.should == "Classname"
    end
    
    it "should not find a non matching method" do
      found_methods = @documentation.search("non a match").found_methods

      found_methods.size.should == 0
    end
    
    it "should find a second method on a single class" do
      @rdoc_context.stub!(:method_list).and_return([mock_rdoc_method("MethodOne"), mock_rdoc_method("MethodTwo")])
      found_methods = @documentation.search("method").found_methods

      found_methods.size.should == 2
      found_methods[1].name.should == "MethodTwo"
      found_methods[1].class_name.should == "Classname"
    end
    
    it "should find a method on a second class" do
      rdoc_context_two = mock_rdoc_class("ClassnameTwo")
      rdoc_context_two.stub!(:method_list).and_return([mock_rdoc_method("MethodTwo")])
      RDoc::TopLevel.stub!(:all_classes_and_modules).and_return([@rdoc_context, rdoc_context_two])
      found_methods = @documentation.search("method").found_methods
      
      found_methods.size.should == 2
      found_methods[0].name.should == "MethodOne"
      found_methods[0].class_name.should == "Classname"
      found_methods[1].name.should == "MethodTwo"
      found_methods[1].class_name.should == "ClassnameTwo"
    end
    
    it "should not find methods that are on undocumented classes" do
      rdoc_class = mock_rdoc_class("Classname", false)
      rdoc_class.stub!(:method_list).and_return([mock_rdoc_method("AlmostAMatch")])
      RDoc::TopLevel.stub!(:all_classes_and_modules).and_return([rdoc_class])
      @documentation.search("AlmostAMatch").found_methods.should be_empty
    end
  end
  
  describe "description" do
    #class.comment
    #method.comment => description
    before(:each) do
      @rdoc_class = mock_rdoc_class("Classname")
      @rdoc_class.stub!(:comment).and_return("I am a comment")
      RDoc::TopLevel.stub!(:all_classes_and_modules).and_return([@rdoc_class])
    end
    
    it "should find no matching comments given an empty string" do
      @documentation.search("").comments.should == []
    end
    
    describe "on a class" do
      it "should find one matching comment on a class" do
        comments = @documentation.search("comment").comments
      
        comments.size.should == 1
        comments[0].text.should == "I am a comment"
        comments[0].class_name.should == "Classname"
      end
    
      it "should not find non matching comments" do
        comments = @documentation.search("non matching").comments
      
        comments.size.should == 0
      end
    
      it "should ignore case" do
        @rdoc_class.stub!(:comment).and_return("I am a CoMment")
        comments = @documentation.search("cOmmEnT").comments
      
        comments.size.should == 1
      end
    end
  end
  
  def mock_rdoc_class(full_name, document_self=true)
    mock("RDoc Context", :full_name => full_name, :document_self => document_self, :method_list => [], :comment => "")
  end
  
  def mock_rdoc_method(name)
    mock("RDoc Method", :name => name)
  end
end