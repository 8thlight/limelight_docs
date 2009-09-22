class_name :text => 'ClassName: Limelight::DSL::ProductionBuilder'
class_description :text => 'The basis of the DSL for building Style objects.'
codeblock do
code :text => '  name "Stage Composer"'
code :text => '  attribute :controller'
code :text => '  attribute :inspector'
end
class_description :text => 'The above example names the Production \'Stage Composer\' and creates two attributes on the Production: \'controller\' and \'inspector\''
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'new'
method_parameters :text => '(production)'
end
end
method do
method_header do
method_name :text => 'attribute'
method_parameters :text => '(sym)'
end
method_description :text => 'Creates an attribute on the Production'
end
