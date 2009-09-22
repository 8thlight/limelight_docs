class_name :text => 'ClassName: Limelight::Commands::FreezeCommand'
class_description :text => 'Freeze a gem into the production.  Frozen gems are unpacked into the root level gem directory. Limelight will automatically require a production\'s frozen gems when loaded.'
codeblock do
code :text => '  Usage: limelight freeze [options] <gem_name|gem_file>'
code :text => '      freeze a gem into a production.'
code :text => '      options:'
code :text => '      -h, --help                       Prints this usage summary.'
code :text => '      -p, --production=<production>    Specify the production where the gem will be frozen.  Default is \'.\'.'
code :text => '      -v, --version=<version>          Specify the gem version. Defaults to latest. Ignored if file provided.'
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'check_production_path'
method_parameters :text => '()'
end
end
method do
method_header do
method_name :text => 'establish_gem_dir'
method_parameters :text => '()'
end
end
method do
method_header do
method_name :text => 'find_system_gem'
method_parameters :text => '()'
end
end
method do
method_header do
method_name :text => 'freeze_gem'
method_parameters :text => '(gem_path)'
end
end
method do
method_header do
method_name :text => 'install_limelight_hook'
method_parameters :text => '()'
end
end
