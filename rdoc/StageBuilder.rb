class_name :text => 'ClassName: Limelight::DSL::StageBuilder'
class_description :text => 'The basis of the DSL for configuring a Stage object.'
attributes_header :text => 'Attributes'
attributes do
attribute_header do
attributes_name :text => '__stage__'
attributes_read_write :text => '[R]'
end
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'default_scene'
method_parameters :text => '(scene_name)'
end
method_description :text => 'Specifies the scene that will be displayed on the stage upon opening of the production.'
end
