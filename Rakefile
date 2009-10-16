require 'rubygems'

task :spec do
  gem 'rspec'
  require 'spec/rake/spectask'
 
  Spec::Rake::SpecTask.new(:all_specs){|t| t.spec_files = FileList['limelight_docs/spec/**/*.rb']}
  Rake::Task[:all_specs].invoke
end

task :features do
  system "jruby -S cucumber features"
end

task :llp do
  system "jruby -S limelight pack limelight_docs"
end