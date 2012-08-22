heading :text => "Try it out!"
@height ||= 200
__install "#{Dir.pwd}/production/documentation/common/sandbox.rb", :height => @height, :button_player => "prop_sandbox_button", :allow_clear => true, :text_area_height => @text_area_height
