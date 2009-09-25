module Documentation
  def casted
    require 'limelight_rdoc/limelight_rdoc'
    @rdoc = LimelightRDoc::LimelightRDoc.new.props_from($LIMELIGHT_LIB)
  end
  
  attr_accessor :rdoc
    
end