class_name :text => 'ClassName: Limelight::Templates::Templater'
class_description :text => 'A class to create directories and file templates.  An instance of Templater must be provided with a target_root and a source_root.  The target_root designates a root directory in which all directories and files will be created.  The source_root designated a directory where all the file template can be found.'
class_description :text => 'A file template is a plain text file.  It may optionally contain token markers in the format !-TOKEN_NAME-!. When a file template is installed by the templater, all the token margers will be replaced by tokens provided in a hash.'
attributes_header :text => 'Attributes'
attributes do
attribute_header do
attributes_name :text => 'target_root'
attributes_read_write :text => '[R]'
end
attribute_header do
attributes_name :text => 'source_root'
attributes_read_write :text => '[R]'
end
attribute_header do
attributes_name :text => 'logger'
attributes_read_write :text => '[RW]'
attribute_description :text => 'See TemplaterLogger'
end
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'clarify'
method_parameters :text => '(path)'
end
method_description :text => 'Carifies a path as relative or absolute.  Essentially if makes sure a path begins with a . if it\'s not an absolute path.'
codeblock do
code :text => '   Templater.clarity(\'some/path\') -> \'./some/path\''
code :text => '   Templater.clarity(\'/root/path\') -> \'/root/path\''
end
end
method do
method_header do
method_name :text => 'new'
method_parameters :text => '(target_root, source_root=Templater.source_dir)'
end
method_description :text => 'New instances Templater require a target_root.  The source_root may optionally be provided.  source_root defaults to Templater.source_dir'
method_description :text => 'The logger is initializes as a TemplaterLogger'
end
method do
method_header do
method_name :text => 'source_dir'
method_parameters :text => '()'
end
method_description :text => 'Return the default source_root for Limelight related file templates.'
method_description :text => '$LIMELIGHT_LIB$/limelight/templates/sources'
end
method do
method_header do
method_name :text => 'directory'
method_parameters :text => '(path)'
end
method_description :text => 'Creates a deirectory.  If the specified directory\'s parent directory is missing, it will be created as will its parent directory, and so on.'
method_description :text => 'After the following call,'
codeblock do
code :text => '   templater.directory("dir1/dir2/dir3/dir4")'
end
method_description :text => 'The following directories will exist, inside the target_root, whether they existed prior to the call or not.'
codeblock do
code :text => '   dir1'
code :text => '   dir1/dir2'
code :text => '   dir1/dir2/dir3'
code :text => '   dir1/dir2/dir3/dir4'
end
end
method do
method_header do
method_name :text => 'establish_directory'
method_parameters :text => '(full_path)'
end
end
method do
method_header do
method_name :text => 'file'
method_parameters :text => '(target, source, tokens = {})'
end
method_description :text => 'Creates the specified file from the specified file template.  The file will be created within the target_root. All parent diretories will be created if needed.  The source paramter should be a path pointing to a file template in the source_root directory.'
method_description :text => 'Assume the the file <code>src/default.txt.template</code> exists in the source_root with the following content.'
codeblock do
code :text => '   !-SCORES-! score and !-YEARS-! years ago, ...'
end
method_description :text => 'When the following command is executed,'
codeblock do
code :text => '   templater.file(\'dir/foo.txt\', \'src/default.txt.template\', :SCORES => "Four", :YEARS => "seven")'
end
method_description :text => 'The file <code>dir/foo.txt</code> will exist in the target_root with the following content.'
codeblock do
code :text => '   Four score and seven years ago, ...'
end
end
method do
method_header do
method_name :text => 'replace_tokens'
method_parameters :text => '(content, tokens)'
end
end
