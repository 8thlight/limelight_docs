require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
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
end
