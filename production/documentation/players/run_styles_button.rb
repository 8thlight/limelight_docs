on_button_pushed do
  begin
    find_canvas
    clear_errors
    styles = styles_from_text_area

    apply_styles_to_canvas(styles)
  rescue Exception => e
    add_error(e.message)
  end
end

def find_canvas
  @canvas = scene.find("canvas")
end

def clear_errors
  style_error = @canvas.find_by_name('style_error')[0]
  @canvas.remove(style_error) if style_error
end

def styles_from_text_area
  code_area = scene.find("code")
  return Limelight.build_styles do
    eval(code_area.text)
  end
end

def apply_styles_to_canvas(styles)
  styles.each_pair do |prop_name, style|
    apply_style_to_props(@canvas.find_by_name(prop_name), style) unless prop_name == "canvas"
  end
end

def add_error(message)
  @canvas << Limelight::Prop.new(:name => "style_error", :text => message)
end

def apply_style_to_props(props, style)
  props.each do |prop|
    prop.style.clear_extensions
    prop.style.add_extension(style)
  end
end
