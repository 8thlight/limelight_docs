module RunPlayersButton
  def mouse_clicked(e)
    prop_to_extend = scene.find_by_name('prop_to_extend')[0]
    @code = scene.find('code')
    @canvas = scene.find('canvas')
    @canvas.children.delete_if {|child| child.name == "error_message"}
    
    begin
      prop_to_extend.instance_eval(@code.text)
    rescue Exception => e
      @canvas << Limelight::Prop.new(:name => "error_message", :text => e.message)
    end
  end
end