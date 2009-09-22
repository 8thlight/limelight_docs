class_name :text => 'ClassName: Limelight::DSL::PropBuilder'
class_description :text => 'The basis of the DSL for building Limelight::Prop objects.'
class_description :text => 'Sample usage:'
codeblock do
code :text => '   builder = Limelight::PropBuilder.new(a_prop)'
code :text => '   builder.instance_eval(&block)'
end
class_description :text => 'The prop passed into the constructor will be the root of the contructed Prop tree. The block passed into instance_eval contains the DSL for building props.'
class_description :text => 'Example block/DSL:'
codeblock do
code :text => '   parent :id => "the_parent" do'
code :text => '     child_one do'
code :text => '       grand_child_one :id => "gc_1", :styles => "grand_child"'
code :text => '       grand_child_two :id => "gc_2", :styles => "grand_child"'
code :text => '     end'
code :text => '     child_two'
code :text => '   end'
end
class_description :text => 'The above example will create a Limelight::Prop named \'parent\' and add it to the root prop passed into the builder. The \'parent\' prop will contain two props named \'child_one\' and \'child_two\'.  \'child_one\' will contain two props named \'grand_child_one\' and \'grand_child_two\'.  \'child_two\' has no child props nor do \'grand_child_one\' or \'grand_child_two\'.'
class_description :text => 'An options Hash may be passed into each prop.  The key, value pairs in the hash will be used to set properties on the prop when it is added to a Limelight::Scene.'
class_description :text => 'See Limelight::Prop'
public_methods_header :text => 'Public Methods'
method do
method_header do
method_name :text => 'new'
method_parameters :text => '(options)'
end
method_description :text => 'Creates a new builder.  If a prop is passed it, it will be the root on which props are created. If the paramter is a Hash, the Hash will be used to construct a prop that will be used as the root.'
end
method do
method_header do
method_name :text => '__'
method_parameters :text => '(options)'
end
method_description :text => 'Add extra initialization options to the prop currently under construction.'
codeblock do
code :text => '   tree :id => "stump" do'
code :text => '     __ :height => "100%", :width => "30", :background_color => :brown'
code :text => '     branch :height => "100", :width => "20"'
code :text => '     branch do'
code :text => '       __ :height => "100", :width => "20"'
code :text => '     end'
code :text => '   end'
end
method_description :text => 'In the above example, the \'tree\' prop has the following initialization options: id, height, width, background_color. The two \'branch\' child props are identical.'
end
method do
method_header do
method_name :text => '__install'
method_parameters :text => '(file, instance_variables = {})'
end
method_description :text => 'Installs props from another file using the prop DSL.  The path will be relative to the root directory of the current production.'
end
method do
method_header do
method_name :text => '__install_instance_variables'
method_parameters :text => '(instance_variables)'
end
method_description :text => 'Installs instance variables, specified by the passed hash, into the PropBuilder instance. The following call...'
codeblock do
code :text => '   __install_instance_variables :one => "1", "two" => "two", :three => 3'
end
method_description :text => '...will result in the following instance variables.'
codeblock do
code :text => '   @one   = "1"'
code :text => '   @two   = "2"'
code :text => '   @three = 3'
end
method_description :text => 'Instance variables are propogated to nested builders so that they need only be defined on the top level builder and all children will have access to them.'
end
