$: << File.expand_path(File.dirname(__FILE__) + "/../") # I don't think I should have to add this - but it hurts nothing and makes Intellij Work
$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require 'rubygems'
require 'spec'
require 'limelight'
$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../")
puts "$PRODUCTION_PATH: #{$PRODUCTION_PATH}"
require 'limelight/specs/spec_helper'