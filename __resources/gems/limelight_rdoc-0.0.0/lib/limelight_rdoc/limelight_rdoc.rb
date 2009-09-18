require 'limelight_rdoc/limelight_generator'

module LimelightRDoc
  class << self
    def document(args = [])
      RDoc::RDoc.new.document(with_limelight_generator(args))
    end
    
    def with_limelight_generator(args)
      args.unshift "--fmt=limelight"
    end
  end
end