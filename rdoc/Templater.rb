class_name :text => 'ClassName: Limelight::Templates::Templater'
class_description :text => 'A class to create directories and file templates.  An instance of Templater must be provided with
 a target_root and a source_root.  The target_root designates a root directory in which all directories and
 files will be created.  The source_root designated a directory where all the file template can be found.

 A file template is a plain text file.  It may optionally contain token markers in the format !-TOKEN_NAME-!.
 When a file template is installed by the templater, all the token margers will be replaced by tokens provided
 in a hash.'
public_methods_header :text => 'Public Methods'
method_name :text => 'clarify'
method_description :text => '# Carifies a path as relative or absolute.  Essentially if makes sure a path begins with a . if it's not
# an absolute path.
#
#   Templater.clarity('some/path') -> './some/path'
#   Templater.clarity('/root/path') -> '/root/path'
#
'
method_name :text => 'new'
method_description :text => '# New instances Templater require a target_root.  The source_root may optionally be provided.  source_root
# defaults to Templater.source_dir
#
# The logger is initializes as a TemplaterLogger
#
'
method_name :text => 'source_dir'
method_description :text => '# Return the default source_root for Limelight related file templates.
#
# $LIMELIGHT_LIB$/limelight/templates/sources
#
'
method_name :text => 'directory'
method_description :text => '# Creates a deirectory.  If the specified directory's parent directory is missing, it will be created as will its
# parent directory, and so on.
#
# After the following call,
#
#   templater.directory("dir1/dir2/dir3/dir4")
#
# The following directories will exist, inside the target_root, whether they existed prior to the call or not.
#
#   dir1
#   dir1/dir2
#   dir1/dir2/dir3
#   dir1/dir2/dir3/dir4
#
'
method_name :text => 'establish_directory'
method_description :text => ''
method_name :text => 'file'
method_description :text => '# Creates the specified file from the specified file template.  The file will be created within the target_root.
# All parent diretories will be created if needed.  The source paramter should be a path pointing to a
# file template in the source_root directory.
#
# Assume the the file <code>src/default.txt.template</code> exists in the source_root with the following content.
#
#   !-SCORES-! score and !-YEARS-! years ago, ...
#
# When the following command is executed,
#
#   templater.file('dir/foo.txt', 'src/default.txt.template', :SCORES => "Four", :YEARS => "seven")
#
# The file <code>dir/foo.txt</code> will exist in the target_root with the following content.
#
#   Four score and seven years ago, ...
#
'
method_name :text => 'replace_tokens'
method_description :text => ''
