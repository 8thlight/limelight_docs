$: << File.expand_path(File.dirname(__FILE__) + "/../../limelight_docs/lib")
$: << File.expand_path(File.dirname(__FILE__) + "/../../limelight_docs")

require 'limelight/specs/spec_helper'
require 'rubygems'

$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../../limelight_docs")
Gem.use_paths(File.join($PRODUCTION_PATH , "__resources", "gems"), Gem.default_path)

Dir.glob(File.join("__resources", "gems", "gems", "**", "lib")).each do |dir|
  $: << dir
end

Before do
  Limelight::Main.initializeTestContext
  Limelight::Specs.producer = Limelight::Producer.new($PRODUCTION_PATH)
  Limelight::Specs.producer.load
  Limelight::Specs.producer.production.production_opening

  stage = Limelight::Specs.producer.theater.default_stage
  
  #TODO - EWM - Don't hardcode the scene name
  $scene = Limelight::Specs.producer.open_scene("documentation", stage)
end

#TODO - EWM - Figure out how to close limelight after each scenario properly.  Right now, one instance gets open per scenario.
# "After do" makes scenarios not run
at_exit do
  unless Limelight::Specs.producer.nil?
    Limelight::Specs.producer.theater.stages.each do |stage|
      frame = stage.instance_variable_get("@frame")
      frame.close if frame
    end
  end
end

Transform /^prop "([^\"]*)"$/ do |prop_id|
  $scene.find(prop_id)
end

When /^I click the (prop "[^\"]*")$/ do |prop|
  prop.mouse_clicked(nil)
end
