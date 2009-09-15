@height ||= 200
@button_text ||= "Run"
canvas :id => "canvas", :height => @height do
  __install @prop_file if @prop_file
  instance_eval(@prop) if @prop
end

sandbox_editing_area do
  text_area :styles => "code_text_area", :id => "code"
  sandbox_button :players => "button #{@button_player}", :text => @button_text, :id => "sandbox_button"
  
  clear_sandbox_button :players => "button", :text => "Clear", :id => "clear_sandbox_button" if @allow_clear
end