@height ||= 200
heading :text => "Try it out!"
canvas :id => "canvas", :height => @height

text_area :styles => "code_text_area", :id => "code"
sandbox_button :players => "button", :text => "Run", :id => "sandbox_button"