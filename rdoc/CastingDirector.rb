class_name :text => 'ClassName: Limelight::CastingDirector'
class_description :text => 'The CastingDirector is responsible for finding Players for Props within a Production. Each Producer has an instance of a CastingDirector'
class_description :text => 'Users of Limelight need not be concerned with this class.'
attributes_header :text => 'Attributes'
attributes do
end
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'new'
method_parameters :text => '(loader)'
end
end
method do
method_header do
method_name :text => 'cast_additional_players'
method_parameters :text => '(prop)'
end
end
method do
method_header do
method_name :text => 'cast_default_player'
method_parameters :text => '(prop)'
end
end
method do
method_header do
method_name :text => 'cast_player'
method_parameters :text => '(prop, player_name)'
end
end
method do
method_header do
method_name :text => 'fill_cast'
method_parameters :text => '(prop)'
end
end
