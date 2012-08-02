require 'spec_helper'
require 'documentation/players/sandbox_codeblock'

class TestCodeblock < Limelight::Prop
  attr_accessor :scene
  include SandboxCodeblock
end

describe "codeblock" do
  
  describe "Prop manipulation" do

    before(:each) do
      @block = TestCodeblock.new
      @code_prop = mock("code prop", :text= => nil)

      @scene = mock("scene", :null_object => true)
      @scene.stub!(:find).with("code").and_return(@code_prop)
      @block.scene = @scene
    end
    
    it "should the sandbox prop when clicked" do
      @scene.should_receive(:find).with("code").and_return(@code_prop)
      @block.mouse_clicked(nil)
    end
    
    it "should set the text on the prop when clicked" do
      @code_prop.should_receive(:text=).with(anything())      
      @block.mouse_clicked(nil)
    end
    
    it "should have set the prop with the correct text code when clicked" do
      @code_prop.should_receive(:text=).with("correct code")      
      @block.stub!(:code).and_return("correct code")
      
      @block.mouse_clicked(nil)
    end
    
    it "should handle missing code prop gracefully" do
      @scene.should_receive(:find).and_return(nil)
      
      lambda {@block.mouse_clicked(nil)}.should_not raise_error
    end
    
    
  end
  

  describe "code concatenation" do

    before(:each) do
      @block = TestCodeblock.new
      @code = mock("prop")
      @code.should_receive(:text).and_return("First Child text")
      @block.children << @code
    end

    it "should have a block of code with one child" do
      @block.code.should == "First Child text"
    end

    it "should have a block with multiple children" do
      second_code = mock("prop")
      second_code.should_receive(:text).and_return("Second Child text")

      @block.children << second_code

      @block.code.should == "First Child text\nSecond Child text"
    end

  end  
  
end

