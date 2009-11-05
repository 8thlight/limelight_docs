require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'limelight_rdoc/comment_formatter'

describe LimelightRDoc::CommentFormatter do
  
  it "should remove the pound sign from a one line comment" do
    LimelightRDoc::CommentFormatter.format("method", "# Comment is here").should == ["method_description :text => 'Comment is here'"]
  end
  
  it "should keep two new lines in a row" do
    LimelightRDoc::CommentFormatter.format("method", "# Comment is here\n\t#\n\t# Second Line").should == ["method_description :text => 'Comment is here'", "method_description :text => 'Second Line'"]
  end
  
  it "should combine two adjacent lines without a separating newline" do
    LimelightRDoc::CommentFormatter.format("method", "# Comment is here\n# Second Line").should == ["method_description :text => 'Comment is here Second Line'"]
  end
  
  it "should return an empty array for a nil or empty comment" do
    LimelightRDoc::CommentFormatter.format("method", nil).should == []
    LimelightRDoc::CommentFormatter.format("method", "").should == []
  end
  
  it "should work with the prefix" do
    LimelightRDoc::CommentFormatter.format("class", "# Comment is here").should == ["class_description :text => 'Comment is here'"]
  end
  
  it "should not a duplicate last line if the last line is a new line" do
    LimelightRDoc::CommentFormatter.format("class", "# Comment is here\n#").should == ["class_description :text => 'Comment is here'"]    
  end  
  
  it "should have codeblocks for anything indented" do
    LimelightRDoc::CommentFormatter.format("class", "#     Indented\n").should == ["codeblock do", "code :text => '     Indented'", "end"]
  end
  
  it "should write two lines of code" do
    LimelightRDoc::CommentFormatter.format("class", "#     Indented\n#  Also Indented").should == ["codeblock do", "code :text => '     Indented'", "code :text => '  Also Indented'", "end"]
  end
  
  it "should complete the previous description on a codeblock" do
    LimelightRDoc::CommentFormatter.format("class", "# Description\n#   Codeblock").should == ["class_description :text => 'Description'", "codeblock do", "code :text => '   Codeblock'", "end"]
  end
  
  it "should complete the codeblock on receiving more description" do
    LimelightRDoc::CommentFormatter.format("class", "#   Codeblock\n# Description").should == ["codeblock do", "code :text => '   Codeblock'", "end", "class_description :text => 'Description'"]
  end
  
  it "should have linebreaks in codeblocks" do
    LimelightRDoc::CommentFormatter.format("class", "#   Codeblock\n#\n#     Codeblock 2").should == ["codeblock do", "code :text => '   Codeblock'", "end", "codeblock do", "code :text => '     Codeblock 2'", "end"]
  end
  
  it "should treat tabs as indentation (i.e. a codeblock)" do
    LimelightRDoc::CommentFormatter.format("class", "#\tCodeblock").should == ["codeblock do", "code :text => '\tCodeblock'", "end"]
  end
  
  it "should escape single quotes" do
    LimelightRDoc::CommentFormatter.format("method", "# Description'").should == ["method_description :text => 'Description\\''"]
  end
  
  it "should only remove the first pound sign from the comment" do
    LimelightRDoc::CommentFormatter.format("method", "# This code is written in C#").should == ["method_description :text => 'This code is written in C#'"]
  end
  
  it "should only remove the first pound sign from the codeblock - comment bug" do
    LimelightRDoc::CommentFormatter.format("class", "#   # Codeblock\n").should == ["codeblock do", "code :text => '   # Codeblock'", "end"]
  end
  
  it "should ignore lines after a line with '--'" do
    LimelightRDoc::CommentFormatter.format("method", "#Included Comment\n#--\n#Do Not Include").should == ["method_description :text => 'Included Comment'"]
  end

  it "should start parsing lines again after a line with '++'" do
    LimelightRDoc::CommentFormatter.format("method", "#Included Comment\n#--\n#Do Not Include\n#++\n#Include Again").should == ["method_description :text => 'Included Comment Include Again'"]
  end

  it "should successfully skip two lines" do
    LimelightRDoc::CommentFormatter.format("method", "#Included Comment\n#--\n#Do Not Include\n#Do Not Include\n#++\n#Include Again").should == ["method_description :text => 'Included Comment Include Again'"]
  end
  
  it "should handle pausing multiple times in a row" do
    LimelightRDoc::CommentFormatter.format("method", "#Included Comment\n#--\n#Do Not Include\n#--\n#Do Not Include Again").should == ["method_description :text => 'Included Comment'"]
  end

  it "should handle resuming multiple times in a row" do
    LimelightRDoc::CommentFormatter.format("method", "#Included Comment\n#--\n#Do Not Include\n#++\n#Include\n#++\n#Include Again").should == ["method_description :text => 'Included Comment Include ++ Include Again'"]
  end
  
  it "should return nothing if begin/end comment with no rdoc flag" do
    LimelightRDoc::CommentFormatter.format("method", "=begin\nSkip Me\n=end").should == []
  end

  it "should parse comments normally if begin/end comment with rdoc flag" do
    LimelightRDoc::CommentFormatter.format("method", "=begin rdoc\nIncluded Comment\n=end").should == ["method_description :text => 'Included Comment'" ]
  end
  
  describe "lists" do
    it "should parse a one item ordered list" do
      LimelightRDoc::CommentFormatter.format("method", "# 1. Item One").should == ["rdoc_list do", "rdoc_list_item :text => '1. Item One'", "end"]
    end

    it "should parse a two item ordered list" do
      LimelightRDoc::CommentFormatter.format("method", "# 1. Item One\n# 2. Item Two").should == ["rdoc_list do", "rdoc_list_item :text => '1. Item One'", "rdoc_list_item :text => '2. Item Two'", "end"]
    end
    
    it "should handle a one item nested ordered list" do
      comments = "# 1. Outer One\n#  1. Nested One\n# 2. Outer Two"
      LimelightRDoc::CommentFormatter.format("method", comments).should == ["rdoc_list do",
                                                                              "rdoc_list_item :text => '1. Outer One'",
                                                                              "rdoc_list do",
                                                                                "rdoc_list_item :text => '1. Nested One'",
                                                                              "end",
                                                                              "rdoc_list_item :text => '2. Outer Two'",
                                                                            "end"]
    end
  
    it "should handle two levels of nested lists" do
      comments = "# 1. Outer One\n#  1. Nested One\n#   1. Nested Two\n# 2. Outer Two"
      LimelightRDoc::CommentFormatter.format("method", comments).should == ["rdoc_list do",
                                                                              "rdoc_list_item :text => '1. Outer One'",
                                                                              "rdoc_list do",
                                                                                "rdoc_list_item :text => '1. Nested One'",
                                                                                "rdoc_list do",
                                                                                  "rdoc_list_item :text => '1. Nested Two'",
                                                                                "end",
                                                                              "end",
                                                                              "rdoc_list_item :text => '2. Outer Two'",
                                                                            "end"]
    end  

    it "should handle complex single spaced nested lists" do
      comments = <<COMMENT
# 1. Outer One
#  1. Nested One
#  2. Nested Two
#   1. SuperNested One
#   2. SuperNested Two
#  3. Nested Three
#   1. SuperNested One
#   2. SuperNested Two
#  4. Nested Four
#  5. Nested Five
# 2. Outer Two
# 3. Outer Three
#  1. Nested One
# 4. Outer Four
COMMENT
      LimelightRDoc::CommentFormatter.format("method", comments).should == ["rdoc_list do",
                                                                              "rdoc_list_item :text => '1. Outer One'",
                                                                              "rdoc_list do",
                                                                                "rdoc_list_item :text => '1. Nested One'",
                                                                                "rdoc_list_item :text => '2. Nested Two'",
                                                                                "rdoc_list do",
                                                                                  "rdoc_list_item :text => '1. SuperNested One'",
                                                                                  "rdoc_list_item :text => '2. SuperNested Two'",
                                                                                "end",
                                                                                "rdoc_list_item :text => '3. Nested Three'",
                                                                                "rdoc_list do",
                                                                                  "rdoc_list_item :text => '1. SuperNested One'",
                                                                                  "rdoc_list_item :text => '2. SuperNested Two'",
                                                                                "end",
                                                                                "rdoc_list_item :text => '4. Nested Four'",
                                                                                "rdoc_list_item :text => '5. Nested Five'",
                                                                              "end",
                                                                              "rdoc_list_item :text => '2. Outer Two'",
                                                                              "rdoc_list_item :text => '3. Outer Three'",
                                                                              "rdoc_list do",
                                                                                "rdoc_list_item :text => '1. Nested One'",
                                                                              "end",
                                                                              "rdoc_list_item :text => '4. Outer Four'",
                                                                            "end"]
    end
    
    it "should handle multiple spaces" do
      comments = <<COMMENT
#  1. Outer One
#     1. Nested One
#     2. Nested Two
#  2. Outer Two
COMMENT
      LimelightRDoc::CommentFormatter.format("method", comments).should == ["rdoc_list do",
                                                                              "rdoc_list_item :text => '1. Outer One'",
                                                                              "rdoc_list do",
                                                                                "rdoc_list_item :text => '1. Nested One'",
                                                                                "rdoc_list_item :text => '2. Nested Two'",
                                                                              "end",
                                                                              "rdoc_list_item :text => '2. Outer Two'",
                                                                            "end"]
    end
    
    it "should make sure to end a list the nested list is last" do
      comments = <<COMMENT
#  1. Outer One
#     1. Nested One
#     2. Nested Two
COMMENT
      LimelightRDoc::CommentFormatter.format("method", comments).should == ["rdoc_list do",
                                                                              "rdoc_list_item :text => '1. Outer One'",
                                                                              "rdoc_list do",
                                                                                "rdoc_list_item :text => '1. Nested One'",
                                                                                "rdoc_list_item :text => '2. Nested Two'",
                                                                              "end",
                                                                            "end"]
    end
    
    it "should handle pre-nesting" do
      comments = <<COMMENT
#    1. Outer One
# 1. Confused One
# 2. Confused Two
COMMENT
      LimelightRDoc::CommentFormatter.format("method", comments).should == ["rdoc_list do",
                                                                              "rdoc_list_item :text => '1. Outer One'",
                                                                            "end",
                                                                            "rdoc_list do",
                                                                              "rdoc_list_item :text => '1. Confused One'",
                                                                              "rdoc_list_item :text => '2. Confused Two'",
                                                                            "end"]
    end
    
    it "should handle descriptions after the list" do
      comments =<<COMMENT
# 1. List One
# 2. List Two
# I am a description of a method
# Second Line
COMMENT
      
      LimelightRDoc::CommentFormatter.format("method", comments).should == ["rdoc_list do",
                                                                              "rdoc_list_item :text => '1. List One'",
                                                                              "rdoc_list_item :text => '2. List Two'",
                                                                            "end",
                                                                            "method_description :text => 'I am a description of a method Second Line'"]
    end
    
    it "should not treat numerals in the middle as lists" do
      comments =<<COMMENT
# Not a 1. List
# 1. List One
# I am a description of a method
COMMENT
      
      LimelightRDoc::CommentFormatter.format("method", comments).should == ["method_description :text => 'Not a 1. List'",
                                                                            "rdoc_list do",
                                                                              "rdoc_list_item :text => '1. List One'",
                                                                            "end",
                                                                            "method_description :text => 'I am a description of a method'"]
      
      
    end
    
    it "should complete all lists when it goes to a new description" do
      comments =<<COMMENT
# 1. List One
#   1. List Two
# Comment
COMMENT

      LimelightRDoc::CommentFormatter.format("method", comments).should == ["rdoc_list do",
                                                                              "rdoc_list_item :text => '1. List One'",
                                                                              "rdoc_list do",
                                                                                "rdoc_list_item :text => '1. List Two'",
                                                                              "end",
                                                                            "end",
                                                                            "method_description :text => 'Comment'"]
      
    end
    
    it "should work with unordered lists" do
      comments = <<COMMENT
# * Outer One
#   * SuperNested One
COMMENT
      LimelightRDoc::CommentFormatter.format("method", comments).should == ["rdoc_list do",
                                                                              "rdoc_list_item :text => '* Outer One'",
                                                                              "rdoc_list do",
                                                                                "rdoc_list_item :text => '* SuperNested One'",
                                                                              "end",
                                                                            "end"]      
    end
  end
  
  it "should format an attribute comment" do
    comment = <<COMMENT
    # Specifies the Width attribute of a prop.
    #   type:           dimension
    #   default_value:  auto
COMMENT
    LimelightRDoc::CommentFormatter.format("attribute", comment).should == ["attribute_description :text => 'Specifies the Width attribute of a prop.'",
                                                                            "codeblock do",
                                                                              "code :text => '   type:           dimension'",
                                                                              "code :text => '   default_value:  auto'",
                                                                            "end"]
  end
end