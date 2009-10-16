$: << File.expand_path(File.dirname(__FILE__) + "/../../limelight_docs/lib")
$: << File.expand_path(File.dirname(__FILE__) + "/../../limelight_docs")

require 'limelight/specs/spec_helper'
require 'rubygems'
# require 'spec'

$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../../limelight_docs")
Gem.use_paths(File.join($PRODUCTION_PATH , "__resources", "gems"), Gem.default_path)

Dir.glob(File.join("__resources", "gems", "gems", "**", "lib")).each do |dir|
  $: << dir
end





gem 'limelight'
require 'limelight/specs/spec_helper'


Given /^I open the production$/ do
  Limelight::Main.initializeTestContext
  Limelight::Specs.producer = Limelight::Producer.new($PRODUCTION_PATH)
  Limelight::Specs.producer.load #also returns stages
  Limelight::Specs.producer.production.production_opening

  stage = Limelight::Specs.producer.theater.default_stage
  $scene = Limelight::Specs.producer.open_scene("documentation", stage)
end

When /^I click "([^\"]*)"$/ do |prop_id|
  $scene.find(prop_id).mouse_clicked(nil)
end