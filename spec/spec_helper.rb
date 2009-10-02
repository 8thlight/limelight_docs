$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require 'rubygems'
require 'spec'
require 'limelight/specs/spec_helper'

$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../")
Gem.use_paths(File.join($PRODUCTION_PATH , "__resources", "gems"), Gem.default_path)

Dir.glob(File.join("__resources", "gems", "gems", "**", "lib")).each do |dir|
  $: << dir
end



module HaveStyleExtensionMatcher
  class HaveStyleExtension
    def initialize(expected)
      @expected = expected
    end

    def matches?(target)
      @target = target
      @target.style.has_extension(@target.scene.styles[@expected])
    end

    def failure_message
      "expected <#{to_string(@target)}> to " +
      "have the style extension '#{to_string(@expected)}'"
    end

    def negative_failure_message
      "expected <#{to_string(@target)}> to " +
      "not have the style extension '#{to_string(@expected)}'"
    end

    def to_string(value)
      return 'nil' if value.nil?
      return value.to_s
    end
  end

  # Actual matcher that is exposed.
  def have_style_extension(expected)
    HaveStyleExtension.new(expected)
  end
end


Spec::Runner.configure do |config|
  config.include(HaveStyleExtensionMatcher)
end

def stub_doc_loader
  require 'rdoc_loader'
  mock_loader = Spec::Mocks::Mock.new("RDocLoader", :load => nil)
  RDocLoader.stub!(:new).and_return(mock_loader)
  Kernel.stub!(:sleep)
end