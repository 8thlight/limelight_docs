class_name :text => 'ClassName: Limelight::Commands::CreateCommand'
class_description :text => 'See the following usages summary

  Usage: limelight create [options] <production|scene> <path>
      Creates the directories and files for a production and/or scene.
      options:
      -h, --help                       Prints this usage summary.
      -s, --scene=<name>               Name of scene when creating a production.  Defaults to 'default_scene'.
      -p, --production_path=<path>     Path of production to contain scene.  Defaults to '.'.
      -S, --spec_path=<path>           Path to spec directory, relative to <production_path>.  Defaults to 'spec'.

 Assume you wanted to create a new production named "love_story" containing two scenes, "midnight_romance" and
 "happily_ever_after".  The following commands would created all the needed files.

   $ jruby -S limelight create -s midnight_romance production love_story
   $ jruby -S limelight create -p love_story scene happily_ever_after'
public_methods_header :text => 'Public Methods'
method_name :text => 'create_production'
method_description :text => ''
method_name :text => 'create_scene'
method_description :text => ''
method_name :text => 'options_hash'
method_description :text => ''
method_name :text => 'parse_production'
method_description :text => ''
method_name :text => 'parse_scene'
method_description :text => ''
