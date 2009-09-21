class_name :text => 'ClassName: Limelight::DSL::StylesBuilder'
class_description :text => 'The basis of the DSL for building Style objects.

 Sample StyleBuilder DSL

  sandbox {
    width "100%"
    height "100%"
    vertical_alignment :top
  }

  sample {
    width 320
    height 320
    gradient :on
  }

  spinner {
    extends :sample
    background_color :green
    secondary_background_color :blue
    gradient_angle 0
    gradient_penetration 100
  }

 This exmple builds three styles: sandbox, sample, spinner.  Within each style block, the individual attributes of
 the style may be set.

 See Limelight::Styles'
public_methods_header :text => 'Public Methods'
method_name :text => 'new'
method_description :text => ''
