require "walkthrough_link"

class TocSection
  attr_reader :name, :links
  
  @@sections = [{:name => "Players", :links => ["getting_started_walkthrough", "creating_props_walkthrough", "prop_sizing_walkthrough", "prop_layout_walkthrough",
                                                "editing_styles_walkthrough", "text_walkthrough", "colors_walkthrough", "borders_walkthrough", "insets_walkthrough",
                                                "backgrounds_walkthrough"]},
                {:name => "Other", :links => ["gradients_walkthrough", "float_walkthrough", "players_walkthrough", "productions_walkthrough",  "stages_walkthrough",
                                              "prop_partials_walkthrough", "images_walkthrough", "animations_walkthrough", "sound_walkthrough"] } ]
  
  def initialize(options)
    @name = options[:name]
    @links = options[:links].collect{ |walkthrough_id| WalkthroughLink.find(walkthrough_id) }
  end

  def self.all
    @@sections.collect {|section| TocSection.new(section)}
  end
    
  def self.sections=(sections)
    @@sections = sections
  end
  
end