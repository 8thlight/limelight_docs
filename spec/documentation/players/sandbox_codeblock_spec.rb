require 'spec_helper'

describe "codeblock" do
  
  describe "Prop manipulation" do

    uses_limelight :scene_path => "documentation" do
      sandbox_codeblock :id => "block"
    end

    before(:each) do
      @block = scene.find("block")
      @code_prop = mock("code prop", :text= => nil)
      scene.stub!(:find).with("code").and_return(@code_prop)
    end
    
    it "should the sandbox prop when clicked" do
      scene.should_receive(:find).with("code").and_return(@code_prop)
      mouse.click @block
    end
    
    it "should set the text on the prop when clicked" do
      @code_prop.should_receive(:text=).with(anything())      
      mouse.click @block
    end
    
    it "should have set the prop with the correct text code when clicked" do
      @code_prop.should_receive(:text=).with("correct code")      
      @block.stub!(:code).and_return("correct code")
      
      mouse.click @block
    end
    
    it "should handle missing code prop gracefully" do
      scene.should_receive(:find).and_return(nil)
      
      lambda {mouse.click(@block)}.should_not raise_error
    end
    
    
  end
  

  describe "code concatenation" do

    uses_limelight :scene_path => "documentation" do
      sandbox_codeblock :id => "block"
    end

    before(:each) do
      @block = scene.find("block")
      @code = Limelight::Prop.new
      @code.stub!(:text).and_return("First Child text")
      @block << @code
    end

    it "should have a block of code with one child" do
      @block.code.should == "First Child text"
    end

    it "should have a block with multiple children" do
      second_code = Limelight::Prop.new
      second_code.stub!(:text).and_return("Second Child text")

      @block << second_code

      @block.code.should == "First Child text\nSecond Child text"
    end

  end  
  
end

