module LimelightRDoc
  class PropString < String
    def puts(prop)
      self << "#{prop}\n"
    end
  end
end