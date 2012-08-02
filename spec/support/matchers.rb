RSpec::Matchers.define :have_style_extension do |expected|
  match do |actual|
    actual.style.has_extension(actual.scene.styles[expected])
  end
end
