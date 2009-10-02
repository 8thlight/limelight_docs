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
