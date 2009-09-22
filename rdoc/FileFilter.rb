class_name :text => 'ClassName: Limelight::FileFilter'
class_description :text => 'A FileFiler is used in conjunction with FileChooser.  It is used to help the user select only files of the desired type.'
attributes_header :text => 'Attributes'
attributes do
attribute_header do
attributes_name :text => 'description'
attributes_read_write :text => '[R]'
end
attribute_header do
attributes_name :text => 'filter'
attributes_read_write :text => '[R]'
end
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'new'
method_parameters :text => '(description, &filter)'
end
method_description :text => 'The filter parameter is a block that contains the logic to decide whether a given file is selectable or not.'
end
method do
method_header do
method_name :text => 'accept'
method_parameters :text => '(file)'
end
method_description :text => 'Called to determine if a file is selectable.  Invokes the filter block.'
end
method do
method_header do
method_name :text => 'getDescription'
method_parameters :text => '()'
end
end
