class_name :text => 'ClassName: Limelight::Client::Playbill'
attributes_header :text => 'Attributes'
attributes do
attribute_header do
attributes_name :text => 'author'
attributes_read_write :text => '[RW]'
end
attribute_header do
attributes_name :text => 'created_at'
attributes_read_write :text => '[RW]'
end
attribute_header do
attributes_name :text => 'description'
attributes_read_write :text => '[RW]'
end
attribute_header do
attributes_name :text => 'id'
attributes_read_write :text => '[RW]'
end
attribute_header do
attributes_name :text => 'name'
attributes_read_write :text => '[RW]'
end
attribute_header do
attributes_name :text => 'size'
attributes_read_write :text => '[RW]'
end
attribute_header do
attributes_name :text => 'title'
attributes_read_write :text => '[RW]'
end
attribute_header do
attributes_name :text => 'updated_at'
attributes_read_write :text => '[RW]'
end
attribute_header do
attributes_name :text => 'version'
attributes_read_write :text => '[RW]'
end
attribute_header do
attributes_name :text => 'llp_path'
attributes_read_write :text => '[RW]'
end
attribute_header do
attributes_name :text => 'thumbnail_path'
attributes_read_write :text => '[RW]'
end
attribute_header do
attributes_name :text => 'uri'
attributes_read_write :text => '[R]'
end
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'from_element'
method_parameters :text => '(element, uri=nil)'
end
end
method do
method_header do
method_name :text => 'new'
method_parameters :text => '(uri=nil)'
end
end
method do
method_header do
method_name :text => 'coerce_value'
method_parameters :text => '(element)'
end
end
method do
method_header do
method_name :text => 'llp'
method_parameters :text => '()'
end
end
method do
method_header do
method_name :text => 'populate_from_element'
method_parameters :text => '(element)'
end
end
method do
method_header do
method_name :text => 'pull'
method_parameters :text => '(path)'
end
end
method do
method_header do
method_name :text => 'thumbnail'
method_parameters :text => '()'
end
end
