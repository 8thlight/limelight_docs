class WalkthroughLink
  attr_reader :id, :text, :slideshow, :title
  @@walkthroughs = [{:id => "getting_started_walkthrough",  :text => "Getting Started", :slideshow => "getting_started", :title => "Getting Started"},
                    {:id => "creating_props_walkthrough",   :text => "Creating Props",  :slideshow => "creating_props", :title => "Creating Props"},
                    {:id => "text_walkthrough",             :text => "Text",            :slideshow => "text", :title => "Text"},
                    {:id => "prop_partials_walkthrough",    :text => "Prop Partials",   :slideshow => "prop_partials", :title => "Prop Partials"},
                    {:id => "editing_styles_walkthrough",   :text => "Editing Styles",  :slideshow => "editing_styles", :title => "Editing Styles"},
                    {:id => "prop_layout_walkthrough",       :text => "Prop Layout",     :slideshow => "prop_layout", :title => "Prop Layout"},
                    {:id => "float_walkthrough",             :text => "Floating Props",  :slideshow => "float", :title => "Floating Props"},
                    {:id => "prop_sizing_walkthrough",       :text => "Prop Sizing",     :slideshow => "prop_sizing", :title => "Prop Sizing"},
                    {:id => "colors_walkthrough",           :text => "Colors",          :slideshow => "colors", :title => "Colors"},
                    {:id => "backgrounds_walkthrough",      :text => "Backgrounds",     :slideshow => "backgrounds", :title => "Backgrounds"},
                    {:id => "gradients_walkthrough",        :text => "Gradients",       :slideshow => "gradients", :title => "Gradients"},
                    {:id => "borders_walkthrough",          :text => "Borders",         :slideshow => "borders", :title => "Borders"},
                    {:id => "insets_walkthrough",           :text => "Margin and Padding",  :slideshow => "insets", :title => "Insets"},
                    {:id => "players_walkthrough",          :text => "Players",         :slideshow => "players", :title => "Players"},
                    {:id => "images_walkthrough",           :text => "Images",          :slideshow => "images", :title => "Images"},
                    {:id => "animations_walkthrough",       :text => "Animations",      :slideshow => "animations", :title => "Animations"},
                    {:id => "sound_walkthrough",            :text => "Sound",           :slideshow => "sound", :title => "Sound"},
                    {:id => "productions_walkthrough",      :text => "Productions",     :slideshow => "productions", :title => "Productions"},
                    {:id => "stages_walkthrough",           :text => "Stages",          :slideshow => "stages", :title => "Stages"}]
  
  def self.all
    @@walkthroughs.collect{ |options| WalkthroughLink.new(options)}
  end
  
  def self.next(current_slideshow)
    all.each_with_index { |link, index| return all[index + 1] if link.slideshow == current_slideshow }
    return nil
  end
  
  def initialize(options)
    @id = options[:id]
    @text = options[:text]
    @slideshow = options[:slideshow]
    @title = options[:title]
  end
end