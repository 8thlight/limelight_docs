class_name :text => 'ClassName: Limelight::Templates::TemplaterLogger'
class_description :text => 'Templaters uses this class to log activity.'
attributes_header :text => 'Attributes'
attributes do
attribute_header do
attributes_name :text => 'output'
attributes_read_write :text => '[RW]'
attribute_description :text => 'An accessor to the output IO. Defaults to STDOUT'
end
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'new'
method_parameters :text => '()'
end
end
method do
method_header do
method_name :text => 'creating_directory'
method_parameters :text => '(name)'
end
end
method do
method_header do
method_name :text => 'creating_file'
method_parameters :text => '(name)'
end
end
method do
method_header do
method_name :text => 'file_already_exists'
method_parameters :text => '(name)'
end
end
method do
method_header do
method_name :text => 'log'
method_parameters :text => '(message, name)'
end
end
