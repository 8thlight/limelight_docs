module RunStylesButton
  def button_pressed(e)
    code_area = scene.find("code")
    
    styles = Limelight.build_styles do
      eval("prop {text_color :blue}")
    end
    
    test_prop = scene.find("test_prop")
    test_prop.style = styles.values[0]
  end
end