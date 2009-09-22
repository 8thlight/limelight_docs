class_name :text => 'ClassName: String'
class_description :text => '- Copyright © 2008-2009 8th Light, Inc. All Rights Reserved. - Limelight and all included source files are distributed under terms of the GNU LGPL.'
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'camalized'
method_parameters :text => '(starting_case = :upper)'
end
method_description :text => 'Converts Ruby style names to Java style camal case.'
codeblock do
code :text => '   "four_score".camalized  => "FourScore"'
code :text => '   "and_seven_years".camalized(:lower)  => "andSevenYears"'
end
end
method do
method_header do
method_name :text => 'titleized'
method_parameters :text => '(starting_case = :upper)'
end
method_description :text => 'Converts ruby style and camalcase strings into title strings where every word is capitalized and separated by a space.'
codeblock do
code :text => '   "four_score".titleized  => "Four Score"'
end
end
method do
method_header do
method_name :text => 'underscored'
method_parameters :text => '()'
end
method_description :text => 'Converts Java camel case names to ruby style underscored names.'
codeblock do
code :text => '   "FourScore".underscored  => "four_score"'
code :text => '   "andSevenYears".underscored  => "and_seven_years"'
end
end
