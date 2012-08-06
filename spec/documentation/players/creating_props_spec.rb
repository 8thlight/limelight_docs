require 'spec_helper'
require 'entrance'

describe "CreatingProps" do
  uses_limelight :scene => "documentation"

  before(:each) do
    Entrance.cue_tutorial scene, :creating_props
    @slideshow = scene.find("slideshow")
  end

  def check_codeblock(codeblock)
    canvas = scene.find('canvas')
    lambda {
      canvas.build do
        eval(codeblock.code)
      end
    }.should_not raise_error
  end

  def check_slide
    codeblocks = scene.find_by_name("sandbox_codeblock")
    codeblocks.each do |codeblock|
      check_codeblock(codeblock)
    end
  end

  it "should not have any exceptions raised in sandbox codeblocks" do
    while !@slideshow.at_end?
      check_slide
      @slideshow.next
    end
  end
end
