@height ||= 200
@prop_options ||= {}
@prop_options.merge!({:styles => "full_size_containing_prop"})
canvas :id => "canvas", :height => @height do
  prop @prop_options
end