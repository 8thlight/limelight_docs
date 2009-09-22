class_name :text => 'ClassName: Limelight::CastingDirector'
class_description :text => 'The CastingDirector is responsible for finding Players for Props within a Production. Each Producer has an instance of a CastingDirector'
line_break
class_description :text => 'Users of Limelight need not be concerned with this class.'
line_break
public_methods_header :text => 'Public Methods'
method do
method_name :text => 'new'
method_parameters :text => '(loader)'
end
method do
method_name :text => 'cast_additional_players'
method_parameters :text => '(prop)'
end
method do
method_name :text => 'cast_default_player'
method_parameters :text => '(prop)'
end
method do
method_name :text => 'cast_player'
method_parameters :text => '(prop, player_name)'
end
method do
method_name :text => 'fill_cast'
method_parameters :text => '(prop)'
end
