require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "Section Header" do
  uses_limelight :with_player => "section_header", :scene_path => "documentation"

  it "should shrink the specified prop when clicked to 0 by 0" do
    section_header.prop_to_remove = "my_prop"
    cast_prop_with_id('my_prop')

    @prop.stub!(:shrunk?).and_return(false)
    @prop.should_receive(:shrink)

    section_header.mouse_clicked(nil)
  end

  it "should shrink other props" do
    section_header.prop_to_remove = "my_prop"
    cast_prop_with_id('not_my_prop')

    @prop.should_not_receive(:shrink)

    section_header.mouse_clicked(nil)
  end

  it "should resize prop back if the prop is shrunk" do
    section_header.prop_to_remove = "my_prop"
    cast_prop_with_id('my_prop')

    @prop.stub!(:shrunk?).and_return(true)
    @prop.should_receive(:grow)
    @prop.should_not_receive(:shrink)

    section_header.mouse_clicked(nil)
  end

  it "should change the background image to arrow_down if the section is being opened" do
    section_header.prop_to_remove = "my_prop"
    cast_prop_with_id('my_prop')
    @prop.stub!(:shrunk?).and_return(true)
    @prop.stub!(:grow)

    section_header.mouse_clicked(nil)

    section_header.style.background_image.should == "images/arrow_down.png"
  end

  it "should change the background image to arrow_down if the section is being opened" do
    section_header.prop_to_remove = "my_prop"
    cast_prop_with_id('my_prop')
    @prop.stub!(:shrunk?).and_return(false)
    @prop.stub!(:shrink)

    section_header.mouse_clicked(nil)

    section_header.style.background_image.should == "images/arrow_right.png"
  end

  it "should open the section" do
    section_header.prop_to_remove = 'test'
    cast_prop_with_id('test')

    @prop.should_receive(:grow)

    section_header.open_section

    section_header.style.background_image.should == "images/arrow_down.png"
  end

  it "should close the section" do
    section_header.prop_to_remove = 'test'
    cast_prop_with_id('test')

    @prop.should_receive(:shrink)

    section_header.close_section

    section_header.style.background_image.should == "images/arrow_right.png"
  end
    
  it "should have a start shunk attribute" do
    section_header.start_shrunk = true
    section_header.start_shrunk.should == true
  end
  
  def cast_prop_with_id(id)
    @prop = Limelight::Prop.new(:id => id)
    section_header << @prop
  end
end

describe "with real props" do
  uses_limelight :scene_path => "documentation" do
    section_header :id => "section_header", :prop_to_remove => "section_header_links", :start_shrunk => true
    section_links :id => "section_header_links", :players => "shrinkable"
  end
  
  it "should be open after opening" do
    scene.find("section_header").open_section
    
    scene.find("section_header").should be_open
  end
  
  it "should be closed after closing" do
    scene.find("section_header").close_section
    
    scene.find("section_header").should_not be_open
  end
end