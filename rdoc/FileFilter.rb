class_name :text => 'ClassName: Limelight::FileFilter'
class_description :text => 'A FileFiler is used in conjunction with FileChooser.  It is used to help the user select only files of the desired type.'
line_break
public_methods_header :text => 'Public Methods'
method do
method_name :text => 'new'
method_parameters :text => '(description, &filter)'
method_description :text => 'The filter parameter is a block that contains the logic to decide whether a given file is selectable or not.'
line_break
end
method do
method_name :text => 'accept'
method_parameters :text => '(file)'
method_description :text => 'Called to determine if a file is selectable.  Invokes the filter block.'
line_break
end
method do
method_name :text => 'getDescription'
method_parameters :text => '()'
end
