class RDocLoader
  
  def initialize(scene)
    @scene = scene
  end
  
  def load
    require 'limelight_rdoc/limelight_rdoc'
    @scene.rdoc = LimelightRDoc::LimelightRDoc.new.props_from($LIMELIGHT_LIB)
  end
end