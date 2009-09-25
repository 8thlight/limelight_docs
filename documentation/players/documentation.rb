require 'rdoc_loader'
module Documentation
  attr_accessor :rdoc
  
  def casted
    RDocLoader.new(scene).load
    
    # # Begin thread
    # require 'limelight_rdoc/limelight_rdoc'
    # @rdoc = LimelightRDoc::LimelightRDoc.new.props_from($LIMELIGHT_LIB)
    # #Enable button
    # #end thread
  end
end