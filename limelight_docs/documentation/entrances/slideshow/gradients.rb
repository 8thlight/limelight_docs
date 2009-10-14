slide do
  line_break
  directions :text => "Limelight makes it simple to create gradients without having to open up Photoshop, and it's all done using styles."
  line_break
  directions :text => "Let's take a look at the different gradient styling options provided by Limelight."
end

slide do
  heading :text => "Background Color"
  directions :text => "In order to display a gradient, both the background_color and secondary_background_color need to be set, then just set the gradient attribute to :on (the default value is :off, so this must be done)."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  background_color :black"
    code :text => "  secondary_background_color :red"
    bold_code :text => "  gradient :on"
    code :text => "}"
  end
  
  __install "documentation/entrances/colors_sandbox/colors_sandbox.rb"
end

slide do
  heading :text => "Gradient Angle"
  directions :text => "The angle of the gradient can be specified in degrees (based on the trigonometric unit circle).  Specifying a value of 0 will place the background_color on the left and the secondary_background_color on the right.  Specifying a value of 90 will place the background color on the bottom and the secondary_background_color on top.  And so on."
  line_break
  directions :text => "The default value is 90."
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  background_color :black"
    code :text => "  secondary_background_color :red"
    bold_code :text => "  gradient_angle 0"
    code :text => "  gradient :on"
    code :text => "}"
  end
  
  __install "documentation/entrances/colors_sandbox/colors_sandbox.rb"  
end

slide do
  heading :text => "Gradient Penetration"
  directions :text => "The gradient penetration is a percentage value that specifies how far the gradient should penetrate into the secondary_background_color."
  line_break
  directions :text => "A value of 100 means that the gradient will start with the background_color, making one transition, reaching the secondary_background_color at the opposite end." 
  line_break
  directions :text => "A value of 50 means that the background color will only penetrate half of the background."
  line_break
  directions :text => "The default value is 100."
end

slide do
  heading :text => "Gradient Penetration"
  directions :text => "Try it out!"
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  background_color :black"
    code :text => "  secondary_background_color :red"
    bold_code :text => "  gradient_penetration 50"
    code :text => "  gradient :on"
    code :text => "}"
  end
  
  __install "documentation/entrances/colors_sandbox/colors_sandbox.rb"
end

slide do
  heading :text => "Cyclic Gradient"
  directions :text => "The cyclic_gradient attribute is only applicable if gradient is on and gradient_penetration is less than 100."
  line_break
  directions :text => "When set to :on, upon reaching the end of a gradient transition, the colors will be transposed and a new transition will ensue."
  line_break
  directions :text => "The default value is :off."
end

slide do
  heading :text => "Cyclic Gradient"
  directions :text => "Try it out!"
  
  sandbox_codeblock do
    code :text => "prop {"
    code :text => "  background_color :black"
    code :text => "  secondary_background_color :red"
    bold_code :text => "  cyclic_gradient :on"
    code :text => "  gradient_penetration 20"
    code :text => "  gradient :on"
    code :text => "}"
  end
  
  __install "documentation/entrances/colors_sandbox/colors_sandbox.rb"
end

__install "documentation/common/finished_slide.rb"