@prop_options ||= {}
@prop_options.merge!({:styles => "full_size_containing_prop"})
canvas :id => "canvas" do
  prop @prop_options
end