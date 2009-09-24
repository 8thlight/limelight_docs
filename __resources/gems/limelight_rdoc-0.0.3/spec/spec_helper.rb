$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
gem 'rdoc'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  
end

module Kernel
  def rputs(string)
    puts "<pre>"
    puts string
    puts "</pre>"
  end
end
