class_name :text => 'ClassName: Limelight::Gems'
public_methods_header :text => 'Public Methods'
method do
method_name :text => 'install'
method_parameters :text => '(gem_name, paths)'
end
method do
method_name :text => 'install_gems_in_production'
method_parameters :text => '(production)'
method_description :text => 'TODO - MDM - This doesn't work when loading gems like: gem 'gem_name'.  Need make use of Gem::SourceIndex. See SourceIndex.load_gems_in'
end
method do
method_name :text => 'load_path'
method_parameters :text => '()'
end
