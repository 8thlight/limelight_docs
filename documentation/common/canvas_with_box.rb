@prop_options ||= {}
@prop_options.merge!({:styles => "prop_to_style"})
canvas :id => "canvas" do
  prop @prop_options
end