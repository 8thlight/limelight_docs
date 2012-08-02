require 'rubygems'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :features do
  system "jruby -S cucumber features"
end

task :llp do
  system "jruby -S limelight pack --name=limelight_docs production"
end
