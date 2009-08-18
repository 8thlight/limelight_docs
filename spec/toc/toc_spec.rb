require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Toc" do
  uses_scene :toc
  
  describe "toc_link" do

    before(:each) do
      @link = scene.find_by_name("toc_link")[0]
    end
    
    it "should do something" do
      @link.mouse_clicked(nil)
    end

  end
end
