require "walkthrough_link"

class TocSection
  attr_reader :name, :links
  
  @@sections = [{:name => "Getting Started", :links => ["getting_started_walkthrough"]},
                {:name => "Props", :links => ["creating_props_walkthrough", "text_walkthrough", "prop_layout_walkthrough", "prop_partials_walkthrough"]},
                {:name => "Advanced Styles", :links => ["editing_styles_walkthrough", "colors_walkthrough", "prop_sizing_walkthrough", "borders_walkthrough", "insets_walkthrough", "backgrounds_walkthrough", "gradients_walkthrough", "float_walkthrough"]},
                {:name => "Players", :links => ["players_walkthrough"]},
                {:name => "Production", :links => ["productions_walkthrough",  "stages_walkthrough"]},
                {:name => "Multimedia", :links => ["images_walkthrough", "animations_walkthrough", "sound_walkthrough"] } ]
  
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