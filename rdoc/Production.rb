class_name :text => 'ClassName: Production'
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'alert'
method_parameters :text => '(message)'
end
end
method do
method_header do
method_name :text => 'default_scene'
method_parameters :text => '()'
end
end
method do
method_header do
method_name :text => 'load_alert_scene'
method_parameters :text => '(message)'
end
end
method do
method_header do
method_name :text => 'load_incompatible_version_scene'
method_parameters :text => '(production_name, required_version)'
end
end
method do
method_header do
method_name :text => 'proceed_with_incompatible_version?'
method_parameters :text => '(production_name, required_version)'
end
end
method do
method_header do
method_name :text => 'process_alert_response'
method_parameters :text => '(response)'
end
end
method do
method_header do
method_name :text => 'process_incompatible_version_response'
method_parameters :text => '(response)'
end
end
method do
method_header do
method_name :text => 'production_opening'
method_parameters :text => '()'
end
end
