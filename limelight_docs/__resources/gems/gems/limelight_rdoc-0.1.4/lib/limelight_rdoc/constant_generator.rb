module LimelightRDoc
  class ConstantGenerator
    def initialize(constant, props)
      @constant = constant
      @props = props
    end
    
    def generate
      @props.puts "rdoc_constant_name :text => '#{@constant.name}'"
      @props.puts "rdoc_constant_value :text => '#{@constant.value}'"
    end
  end
end