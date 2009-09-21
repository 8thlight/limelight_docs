class_name :text => 'ClassName: Limelight::DSL::StagesBuilder'
class_description :text => 'The basis of the DSL for building Stage objects.

  stage "inspector" do
    default_scene "inspector"
    title "Limelight Composer Inspector"
    location [0, 0]
    size [300, 800]
  end

  stage "viewer" do
    title "Limelight Composer Viewer"
    location [350, 0]
    size [800, 800]
  end

 In this example above, two stages are created for the production.  One is named 'inspector' and the other is named
 'viewer'.  'inspector' has a default scene that will be loaded on startup.  'viewer' will not contain any scene
 on startup.  Using the DSL, each stage can be configured to set the title, location, size, or any other attribute
 of a stage.

 See Limelight::Stage'
public_methods_header :text => 'Public Methods'
method_name :text => 'new'
method_description :text => '# Constructs a new StagesBuilder.  A Theater object is required as a parameter.  Each stages created will belong
# to the Theater passed in.
#
'
method_name :text => 'stage'
method_description :text => '# Creates a new stage with the provided name.  The block will contain StageBuilder DSL to configure the stage.
#
'
