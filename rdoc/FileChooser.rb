class_name :text => 'ClassName: Limelight::FileChooser'
class_description :text => 'An object that manages the selection of a file on the file system.  When invoked, a file chooser window will pop up and allow the user to select a file.'
line_break
public_methods_header :text => 'Public Methods'
method do
method_name :text => 'new'
method_parameters :text => '(options = {}, &filter)'
method_description :text => 'Creates a new FileChooser. Options may include: * :description => a string describing the desired file * :parent => (required) the parent window * :directory => starting directory * :title => title of the window * :directories_only => boolean, true if the user must select a directory * :files_only => boolean, true if the user must select a file'
line_break
end
method do
method_name :text => 'choose_file'
method_parameters :text => '()'
method_description :text => 'Opens the windows and returns the chosen file.'
line_break
end
method do
method_name :text => 'configure_file_selection_mode'
method_parameters :text => '()'
end
method do
method_name :text => 'create_chooser'
method_parameters :text => '()'
end
