class RDocLoader
  
  def initialize(scene)
    @scene = scene
  end
  
  def load
    require 'limelight_rdoc/limelight_rdoc'
    @scene.rdoc = LimelightRDoc::LimelightRDoc.new.props_from($LIMELIGHT_LIB)
    @prop = @scene.find('RDoc') 
    @prop.style.add_extension(@scene.styles['unselected_toc_heading'])
    @prop.style.remove_extension(@scene.styles['disabled_toc_heading'])
  end
end