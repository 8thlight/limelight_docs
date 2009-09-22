class_name :text => 'ClassName: Limelight::DSL::ProductionBuilder'
class_description :text => 'The basis of the DSL for building Style objects.'
line_break
codeblock do
code :text => '  name "Stage Composer"'
code :text => '  attribute :controller'
code :text => '  attribute :inspector'
end
line_break
class_description :text => 'The above example names the Production 'Stage Composer' and creates two attributes on the Production: 'controller' and 'inspector''
line_break
public_methods_header :text => 'Public Methods'
method do
method_name :text => 'new'
method_parameters :text => '(production)'
end
method do
method_name :text => 'attribute'
method_parameters :text => '(sym)'
method_description :text => 'Creates an attribute on the Production'
line_break
end
