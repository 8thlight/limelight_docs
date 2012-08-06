$: << File.expand_path(File.dirname(__FILE__) + "/../production/lib")
$: << File.expand_path(File.dirname(__FILE__) + "/../production")

require 'rubygems'
require "bundler/setup"
require 'rspec'
$: << "/Users/ekoslow/.rvm/gems/jruby-1.6.5.1/gems/limelight-0.6.14-java/ruby/lib"
require 'limelight/specs/spec_helper'

$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../production")

include Limelight::Specs::SpecHelper

Dir[File.expand_path(File.dirname(__FILE__) + "/support/*.rb")].each {|f| require f}
