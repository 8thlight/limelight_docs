class_name :text => 'ClassName: Limelight::Commands::CreateCommand'
class_description :text => 'See the following usages summary'
codeblock do
code :text => '  Usage: limelight create [options] <production|scene> <path>'
code :text => '      Creates the directories and files for a production and/or scene.'
code :text => '      options:'
code :text => '      -h, --help                       Prints this usage summary.'
code :text => '      -s, --scene=<name>               Name of scene when creating a production.  Defaults to \'default_scene\'.'
code :text => '      -p, --production_path=<path>     Path of production to contain scene.  Defaults to \'.\'.'
code :text => '      -S, --spec_path=<path>           Path to spec directory, relative to <production_path>.  Defaults to \'spec\'.'
end
class_description :text => 'Assume you wanted to create a new production named "love_story" containing two scenes, "midnight_romance" and "happily_ever_after".  The following commands would created all the needed files.'
codeblock do
code :text => '   $ jruby -S limelight create -s midnight_romance production love_story'
code :text => '   $ jruby -S limelight create -p love_story scene happily_ever_after'
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'create_production'
method_parameters :text => '()'
end
end
method do
method_header do
method_name :text => 'create_scene'
method_parameters :text => '()'
end
end
method do
method_header do
method_name :text => 'options_hash'
method_parameters :text => '()'
end
end
method do
method_header do
method_name :text => 'parse_production'
method_parameters :text => '(args)'
end
end
method do
method_header do
method_name :text => 'parse_scene'
method_parameters :text => '(args)'
end
end
