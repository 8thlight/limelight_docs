require "walkthrough_link"

class TocSection
  attr_reader :name, :links
  
  @@sections = [{:name => "Getting Started", :links => ["getting_started_walkthrough"], :start_shrunk => false},
                {:name => "Props", :links => ["creating_props_walkthrough", "text_walkthrough", "prop_layout_walkthrough", "prop_partials_walkthrough"], :start_shrunk => true},
                {:name => "Advanced Styles", :links => ["editing_styles_walkthrough", "colors_walkthrough", "prop_sizing_walkthrough", "borders_walkthrough", "insets_walkthrough", "backgrounds_walkthrough", "gradients_walkthrough", "float_walkthrough"], :start_shrunk => true},
                {:name => "Players", :links => ["players_intro_walkthrough", "players_custom_walkthrough", "players_built_in_walkthrough", "building_props_walkthrough"], :start_shrunk => true},
                {:name => "Production", :links => ["productions_walkthrough",  "stages_walkthrough"], :start_shrunk => true},
                {:name => "Multimedia", :links => ["images_walkthrough", "animations_walkthrough", "sound_walkthrough"], :start_shrunk => true} ]
  
  def initialize(options)
    @name = options[:name]
    @links = options[:links].collect{ |walkthrough_id| WalkthroughLink.find(walkthrough_id) }
    @start_shrunk = options[:start_shrunk]
  end

  def self.all
    @@sections.collect {|section| TocSection.new(section)}
  end
    
  def self.sections=(sections)
    @@sections = sections
  end
  
  def start_shrunk?
    return @start_shrunk
  end
end