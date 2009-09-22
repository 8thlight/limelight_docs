class_name :text => 'ClassName: Limelight::DSL::BuildException'
class_description :text => 'An Exception used by many of the DSL Builders.  Allows nice errors messages, with line numbers, to be printed.'
attributes_header :text => 'Attributes'
attributes do
attribute_header do
attributes_name :text => 'filename'
attributes_read_write :text => '[R]'
end
attribute_header do
attributes_name :text => 'line_number'
attributes_read_write :text => '[R]'
end
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'new'
method_parameters :text => '(filename, file_contents, e)'
end
end
method do
method_header do
method_name :text => 'build_error_message'
method_parameters :text => '()'
end
end
method do
method_header do
method_name :text => 'find_line_number'
method_parameters :text => '()'
end
end
