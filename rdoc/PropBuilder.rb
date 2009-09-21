class_name :text => 'ClassName: Limelight::DSL::PropBuilder'
class_description :text => 'The basis of the DSL for building Limelight::Prop objects.

 Sample usage:

   builder = Limelight::PropBuilder.new(a_prop)
   builder.instance_eval(&block)

 The prop passed into the constructor will be the root of the contructed Prop tree.
 The block passed into instance_eval contains the DSL for building props.

 Example block/DSL:

   parent :id => "the_parent" do
     child_one do
       grand_child_one :id => "gc_1", :styles => "grand_child"
       grand_child_two :id => "gc_2", :styles => "grand_child"
     end
     child_two
   end

 The above example will create a Limelight::Prop named 'parent' and add it to the root prop passed into the builder.
 The 'parent' prop will contain two props named 'child_one' and 'child_two'.  'child_one' will contain two props named
 'grand_child_one' and 'grand_child_two'.  'child_two' has no child props nor do 'grand_child_one' or 'grand_child_two'.

 An options Hash may be passed into each prop.  The key, value pairs in the hash will be used to set properties on the prop
 when it is added to a Limelight::Scene.

 See Limelight::Prop'
public_methods_header :text => 'Public Methods'
method_name :text => 'new'
method_description :text => '# Creates a new builder.  If a prop is passed it, it will be the root on which props are created.
# If the paramter is a Hash, the Hash will be used to construct a prop that will be used as the root.
#
'
method_name :text => '__'
method_description :text => '# Add extra initialization options to the prop currently under construction.
#
#   tree :id => "stump" do
#     __ :height => "100%", :width => "30", :background_color => :brown
#     branch :height => "100", :width => "20"
#     branch do
#       __ :height => "100", :width => "20"
#     end
#   end
#
# In the above example, the 'tree' prop has the following initialization options: id, height, width, background_color.
# The two 'branch' child props are identical.
#
'
method_name :text => '__install'
method_description :text => '# Installs props from another file using the prop DSL.  The path will be relative to the
# root directory of the current production.
#
'
method_name :text => '__install_instance_variables'
method_description :text => '# Installs instance variables, specified by the passed hash, into the PropBuilder instance.
# The following call...
#
#   __install_instance_variables :one => "1", "two" => "two", :three => 3
#
# ...will result in the following instance variables.
#
#   @one   = "1"
#   @two   = "2"
#   @three = 3
#
# Instance variables are propogated to nested builders so that they need only be defined
# on the top level builder and all children will have access to them.
#
'
