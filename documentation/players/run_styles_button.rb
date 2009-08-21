module RunStylesButton
  def button_pressed(e)
    styles = styles_from_text_area

    apply_styles_to_canvas(styles)
  end
  
  def styles_from_text_area
    code_area = scene.find("code")
    return Limelight.build_styles do
      eval(code_area.text)
    end
  end
  
  def apply_styles_to_canvas(styles)
    canvas = scene.find("canvas")
    styles.each_pair do |prop_name, style|
      canvas.find_by_name(prop_name).each do |prop|
        prop.style.removeScreen()
        prop.style.applyScreen(style)
      end
    end
  end
end