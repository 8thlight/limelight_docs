class_name :text => 'ClassName: Limelight::DSL::StagesBuilder'
class_description :text => 'The basis of the DSL for building Stage objects.'
line_break
codeblock do
code :text => '  stage "inspector" do'
code :text => '    default_scene "inspector"'
code :text => '    title "Limelight Composer Inspector"'
code :text => '    location [0, 0]'
code :text => '    size [300, 800]'
code :text => '  end'
end
line_break
codeblock do
code :text => '  stage "viewer" do'
code :text => '    title "Limelight Composer Viewer"'
code :text => '    location [350, 0]'
code :text => '    size [800, 800]'
code :text => '  end'
end
line_break
class_description :text => 'In this example above, two stages are created for the production.  One is named 'inspector' and the other is named 'viewer'.  'inspector' has a default scene that will be loaded on startup.  'viewer' will not contain any scene on startup.  Using the DSL, each stage can be configured to set the title, location, size, or any other attribute of a stage.'
line_break
class_description :text => 'See Limelight::Stage'
line_break
public_methods_header :text => 'Public Methods'
method do
method_name :text => 'new'
method_parameters :text => '(theater)'
method_description :text => 'Constructs a new StagesBuilder.  A Theater object is required as a parameter.  Each stages created will belong to the Theater passed in.'
line_break
end
method do
method_name :text => 'stage'
method_parameters :text => '(name, &block)'
method_description :text => 'Creates a new stage with the provided name.  The block will contain StageBuilder DSL to configure the stage.'
line_break
end
