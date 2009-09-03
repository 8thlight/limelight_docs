slide do
  heading :text => "Colors"
  directions :text => "When styling your Production, you will often need to set a color.  There are several ways to specify colors."
end

slide do
  heading :text => "1. Colors as Hexidecimal Values"
  directions :text => "Limelight uses the RGB (Red, Green, Blue) triad to define colors.  In addition, Limelight applies an alpha (transparency) channel to its colors. Specifying an alpha value is optional. When using alpha, a value of 0 (no alpha) means fully transparent and a value of FF (255 in decimal, full alpha) means the color is opaque."
end

slide do
  heading :text => "2. Full Hex Values"
  directions :text => "When using full hex values, each channel uses a 2 digit hex value ranging between 00 (0) and FF (255).  You can use both lower and upper case letters."
  line_break
  code :text => "  * #RRGGBB - Format using full hex values, without alpha"
  code :text => "  * #RRGGBBAA - Format using full hex values, with alpha"  
end

slide do
  heading :text => "3. Full Hex Examples"
  
  directions :text => "Here are some examples."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  background_color \"#FF0000\" #red (no alpha)"
    code :text => "}"
  end
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  background_color \"#FF000022\" #translucent red"
    code :text => "}"
  end
  
  __install "documentation/common/canvas_with_box.rb", :prop_options => {:width => "90%", :height => "85%", :border_width => 1, :border_color => :black}
  __install "documentation/common/styles_sandbox.rb"
end

slide do
  heading :text => "4. Short Hex Values"
  directions :text => "When using short hex values, each channel uses one hex digit. The actual value applied is x * 16 + x or, the hex value \"xx\", where x is the single hex digit."
  line_break
  code :text => "  * #RGB - Format using short hex values, without alpha"
  code :text => "  * #RGBA - Format using short hex values, with alpha"
end

slide do
  heading :text => "5. Short Hex Examples"
  
  directions :text => "Here are the same Full Hex examples in Short Hex:"
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  background_color \"#F00\" #red (no alpha)"
    code :text => "}"
  end
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  background_color \"#F002\" #translucent red"
    code :text => "}"
  end
  
  __install "documentation/common/canvas_with_box.rb", :prop_options => {:width => "100%", :height => "100%", :border_width => 1, :border_color => :black}
  __install "documentation/common/styles_sandbox.rb"
end

slide do
  heading :text => "7. Named Colors"
  directions :text => "You may specify a color by name.  Here are some Named Color examples:"
  
  directions :text => "For a full list of named colors, "  
  link :text => " click here.", :url => "http://limelightwiki.8thlight.com/wiki/Colors#Named_Colors", :styles => "link_in_directions"
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  background_color :dark_red"
    code :text => "}"
  end

  __install "documentation/common/canvas_with_box.rb", :prop_options => {:width => "100%", :height => "100%", :border_width => 1, :border_color => :black}
  __install "documentation/common/styles_sandbox.rb"
end

slide do
  heading :text => "8. Finished"
  directions :text => "Great!  Now you know all about Colors.  When you're ready, head to the next tutorial."
end