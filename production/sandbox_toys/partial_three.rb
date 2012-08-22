example_partial do
  label :text => 'This is outside the border'
  nested_prop(:border_width => 1) do
    __install 'sandbox_toys/partial_one.rb'
  end
end
