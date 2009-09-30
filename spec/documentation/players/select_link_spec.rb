require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'documentation/players/select_link'
require 'entrance'

describe "SelectLink" do

  before(:each) do
    @prop = Limelight::Prop.new
    @scene = mock(Limelight::Scene, :find_by_name => [], :find => @prop, :styles => {})
    @link = SelectLink.new(:scene => @scene, :name => "tutorial_link", :id => "tutorial_link_id")
  end
    
  it "should highlight the clicked link" do
    @scene.stub!(:styles).and_return({"selected_toc_item" => Limelight::Styles::RichStyle.new})
    @scene.stub!(:find).with("tutorial_link_id").and_return(@prop)
    
    @link.select

    @prop.style.has_extension(@scene.styles["selected_toc_item"]).should be_true
  end

  it "should unhighlight previously selected links" do
    original_prop = Limelight::Prop.new
    original_prop.style.add_extension(@scene.styles["selected_toc_item"])
    
    @scene.stub!(:styles).and_return({"selected_toc_item" => Limelight::Styles::RichStyle.new})
    @scene.stub!(:find_by_name).with("tutorial_link").and_return([original_prop, @prop])

    @link.select

    original_prop.style.has_extension(@scene.styles["selected_toc_item"]).should be_false
  end
  
end