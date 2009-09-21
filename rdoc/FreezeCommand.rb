class_name :text => 'ClassName: Limelight::Commands::FreezeCommand'
class_description :text => 'Freeze a gem into the production.  Frozen gems are unpacked into the root level gem directory.
 Limelight will automatically require a production's frozen gems when loaded.

  Usage: limelight freeze [options] <gem_name|gem_file>
      freeze a gem into a production.
      options:
      -h, --help                       Prints this usage summary.
      -p, --production=<production>    Specify the production where the gem will be frozen.  Default is '.'.
      -v, --version=<version>          Specify the gem version. Defaults to latest. Ignored if file provided.'
public_methods_header :text => 'Public Methods'
method_name :text => 'check_production_path'
method_description :text => ''
method_name :text => 'establish_gem_dir'
method_description :text => ''
method_name :text => 'find_system_gem'
method_description :text => ''
method_name :text => 'freeze_gem'
method_description :text => ''
method_name :text => 'install_limelight_hook'
method_description :text => ''
