class_name :text => 'ClassName: Limelight::Commands::Command'
class_description :text => 'The base class for all limelight commands.  The following is a list of them all.

  Usage: limelight <command> [options] [params]
    commands:
    create         Creates the directories and files for a production and/or scene.
    freeze         freeze a gem into a production.
    open           Open a limelight production.
    pack           Pack a limelight production into a .llp file.'
public_methods_header :text => 'Public Methods'
method_name :text => 'description'
method_description :text => '# Abstract class level methof that returns a string description of the command.  Derivatives should
# override this class level method.
#
'
method_name :text => 'install_as'
method_description :text => '# Sets the alias for the derivative command and installs it in the command listing.  All derivative much
# call this method exactly once.
#
'
method_name :text => 'build_options'
method_description :text => '# Abstract method to define the command line options in the OptionParser.  Derivative should override
# this method if they offer command line options 
#
'
method_name :text => 'do_requires'
method_description :text => '# Abstract method to require any files needed for processing the command.  Derivative should override this
# method if they need to require any files.
#
'
method_name :text => 'options_spec'
method_description :text => '# Retreives the OptionParser instance for this command.  It will create it if it doesn't exist.
#
'
method_name :text => 'parse'
method_description :text => '# Parse the arguments.  All options will be parsed first, then parse_remainder will be called on
# remaining args.  Derivative should not override this method.
#
'
method_name :text => 'parse_error'
method_description :text => '# Prints an exception that occurs while parsing the arguments.  The usages summary will follow.
#
'
method_name :text => 'parse_remainder'
method_description :text => '# Abstract method to parse command line paramters.  Parameter are those command line arguments listed after
# the options.  Derivatives should override this method they take command line paramters.
#
'
method_name :text => 'run'
method_description :text => '# Runs the command.  This is TemplateMethod.  It will first parse the arguments, then require files, and finally
# process the command.  Derivative should not override this method.
#
'
method_name :text => 'usage'
method_description :text => '# Prints the usage summary for a command.
#
'
