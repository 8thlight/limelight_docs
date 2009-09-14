module RunPlayersButton
  def mouse_clicked(e)
    init
    clear_errors
    attach_code
  end
  
  protected ###############################################
  
  def init
    @code = scene.find('code')
    @canvas = scene.find('canvas')
    @prop_to_extend = @canvas.find_by_name('prop_to_extend')[0]
  end
  
  def clear_errors
    error_prop = @canvas.find_by_name("error_message")[0]
    @canvas.remove(error_prop) if error_prop
  end
  
  def attach_code
    begin
      @prop_to_extend.instance_eval(@code.text)
    rescue Exception => e
      @canvas << Limelight::Prop.new(:name => "error_message", :text => e.message)
    end
  end
end