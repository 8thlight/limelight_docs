$: << File.expand_path(File.dirname(__FILE__) + "/../../production/lib")
$: << File.expand_path(File.dirname(__FILE__) + "/../../production")

require File.expand_path(File.dirname(__FILE__) + "/../support/env")
require 'limelight/specs/spec_helper'
require 'rubygems'

import java.awt.event.KeyEvent
import javax.swing.JPanel


$PRODUCTION_PATH = File.expand_path(File.dirname(__FILE__) + "/../../production")
Gem.use_paths(File.join($PRODUCTION_PATH , "__resources", "gems"), Gem.default_path)

Dir.glob(File.join("__resources", "gems", "gems", "**", "lib")).each do |dir|
  $: << dir
end

Before do
  Limelight::Main.initializeTestContext
  Limelight::Specs.producer = Limelight::Producer.new($PRODUCTION_PATH)
  Limelight::Specs.producer.production.extend(MockProduction)
  Limelight::Specs.producer.open

  stage = Limelight::Specs.producer.theater.stages[0]
  $scene = stage.current_scene
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


def key_press_event(char)
  # KeyEvent event = new KeyEvent(new JPanel(), 1, 2, 3, 4, 'a');
  event = KeyEvent.new(JPanel.new, 1, 2, 3, 4, char)
  return event
end

When /^I type "([^\"]*)" in the prop "([^\"]*)"$/ do |text, prop_id|
  pending
  text_area = $scene.find(prop_id)
  text_area.text = text
  text.each_byte do |byte|
    event = key_press_event(byte.chr)
    text_area.key_pressed(event)
    text_area.key_typed(event)
    text_area.key_released(event)
  end
end
