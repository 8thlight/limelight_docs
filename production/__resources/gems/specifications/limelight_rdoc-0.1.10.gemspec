# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{limelight_rdoc}
  s.version = "0.1.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eric Smith"]
  s.date = %q{2009-11-03}
  s.default_executable = %q{ll_rdoc}
  s.description = %q{longer description}
  s.email = %q{eric@8thlight.com}
  s.executables = ["ll_rdoc"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "VERSION", "bin/ll_rdoc", "lib/limelight_rdoc.rb", "lib/limelight_rdoc/comment_formatter.rb", "lib/limelight_rdoc/documentation.rb", "lib/limelight_rdoc/generators/attribute.rb", "lib/limelight_rdoc/generators/class_file.rb", "lib/limelight_rdoc/generators/constant.rb", "lib/limelight_rdoc/generators/method.rb", "lib/limelight_rdoc/generators/method_source.rb", "lib/limelight_rdoc/limelight_generator.rb", "lib/limelight_rdoc/limelight_rdoc.rb", "lib/limelight_rdoc/prop_string.rb", "spec/limelight_rdoc/comment_formatter_spec.rb", "spec/limelight_rdoc/documentation_spec.rb", "spec/limelight_rdoc/generators/attribute_spec.rb", "spec/limelight_rdoc/generators/class_file_spec.rb", "spec/limelight_rdoc/generators/constant_spec.rb", "spec/limelight_rdoc/generators/method_source_spec.rb", "spec/limelight_rdoc/generators/method_spec.rb", "spec/limelight_rdoc/limelight_generator_spec.rb", "spec/limelight_rdoc/limelight_rdoc_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/paytonrules/limelight_rdoc}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Generates rdoc in limelight format}
  s.test_files = ["spec/limelight_rdoc/comment_formatter_spec.rb", "spec/limelight_rdoc/documentation_spec.rb", "spec/limelight_rdoc/generators/attribute_spec.rb", "spec/limelight_rdoc/generators/class_file_spec.rb", "spec/limelight_rdoc/generators/constant_spec.rb", "spec/limelight_rdoc/generators/method_source_spec.rb", "spec/limelight_rdoc/generators/method_spec.rb", "spec/limelight_rdoc/limelight_generator_spec.rb", "spec/limelight_rdoc/limelight_rdoc_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_runtime_dependency(%q<rdoc>, [">= 0"])
      s.add_runtime_dependency(%q<statemachine>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<statemachine>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<statemachine>, [">= 0"])
  end
end
