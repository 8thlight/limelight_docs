$: << File.expand_path(File.dirname(__FILE__) + "/../lib")

require 'rubygems'
require 'spec'
require 'limelight'
$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../")
require 'limelight/specs/spec_helper'