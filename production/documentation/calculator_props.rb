calculator_container do
  calculator_row do
    calculator_display :id => "calculator_display"
  end
  calculator_row do
    calculator_button :text => 7, :styles => "calculator_number"
    calculator_button :text => 8, :styles => "calculator_number"
    calculator_button :text => 9, :styles => "calculator_number"
    calculator_button :text => "+", :styles => "calculator_function"
  end 
  calculator_row do
    calculator_button :text => 4, :styles => "calculator_number"
    calculator_button :text => 5, :styles => "calculator_number"
    calculator_button :text => 6, :styles => "calculator_number"
    calculator_button :text => "-", :styles => "calculator_function"
  end
  calculator_row do
    calculator_button :text => 1, :styles => "calculator_number"
    calculator_button :text => 2, :styles => "calculator_number"
    calculator_button :text => 3, :styles => "calculator_number"
    calculator_button :text => "*", :styles => "calculator_function"
  end
  calculator_row do
    calculator_button :text => 0, :styles => "calculator_number"
    calculator_equals :text => "=", :styles => "calculator_function"
    calculator_button :text => "/", :styles => "calculator_function"
    calculator_clear :text => "C"
  end
end