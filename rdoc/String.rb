class_name :text => 'ClassName: String'
class_description :text => '- Copyright © 2008-2009 8th Light, Inc. All Rights Reserved.
- Limelight and all included source files are distributed under terms of the GNU LGPL.'
public_methods_header :text => 'Public Methods'
method_name :text => 'camalized'
method_description :text => '# Converts Ruby style names to Java style camal case.
#
#   "four_score".camalized # => "FourScore"
#   "and_seven_years".camalized(:lower) # => "andSevenYears"
#
'
method_name :text => 'titleized'
method_description :text => '# Converts ruby style and camalcase strings into title strings where every word is capitalized and separated by a space.
#
#   "four_score".titleized # => "Four Score"
#
'
method_name :text => 'underscored'
method_description :text => '# Converts Java camel case names to ruby style underscored names.
#
#   "FourScore".underscored # => "four_score"
#   "andSevenYears".underscored # => "and_seven_years"
#
'
