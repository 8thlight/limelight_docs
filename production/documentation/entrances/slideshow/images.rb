slide do
  heading :text => "Images"
  directions :text => "You first saw images in the Players tutorial.  Images have a few quirks that are worth exploring here, so lets get to it."
end

slide do
  heading :text => "Adding Images"
  directions :text => "You've already seen how to add an image.  Simply place the Prop, set its Player to 'image' and set the image path.  Use the prop below to refresh your memory."
  
  sandbox_codeblock do
    code :text => "image_prop :players => 'image', :image => 'images/image.jpg'"
  end

  __install "documentation/common/prop_sandbox.rb"
end

slide do
  heading :text => "Scaling"
  directions :text => "Hmm, that wasn't very good.  Lets see how we can fix it.  Images have a height and a width property like any prop, and when they are set to auto the image will appear as the actual size of the image.  However images can also be scaled to a size of your choosing.  In this example you'll set the scaled property to true - and set the height to fit this window (100%).  Notice how the image's width is adjusted to keep the aspect ratio of the image, because the width is scaled to fit as well."
  
  sandbox_codeblock do
    code :text => "image_prop :players => 'image', :image => 'images/image.jpg', :scaled => true, :height => '100%'"
  end

  __install "documentation/common/prop_sandbox.rb", :height => 140
end


slide do
  heading :text => "Scaling"
  directions :text => "That's handy - but what happens when we don't scale the image and do the same thing?  The image just gets cropped."
  
  sandbox_codeblock do
    code :text => "image_prop :players => 'image', :image => 'images/image.jpg', :scaled => false, :height => 40"
  end

  __install "documentation/common/prop_sandbox.rb"
end

slide do
  heading :text => "Scaling"
  directions :text => "Finally you can also deform the image by setting the width and height to values that aren't of the same aspect ratio of the image, and ignoring the scaling flag.   Does Homer really need to get fatter?"
  
  sandbox_codeblock do
    code :text => "image_prop :players => 'image', :image => 'images/image.jpg', :height => 150, :width => 400"
  end

  __install "documentation/common/prop_sandbox.rb"
end

slide do
  heading :text => "Rotation"
  directions :text => "Images can also be rotated using the rotation property.  Let's let poor Homer lie down.  Note that Negative is counter-clockwise, so naturally positive is clockwise.  Rotation is specified in degrees, where 0 is north."
  sandbox_codeblock do
    code :text => "image_prop :players => 'image', :image => 'images/image.jpg', :scaled => true, :height => 130, :rotation => '-90'"
  end

  __install "documentation/common/prop_sandbox.rb"
end

__install "documentation/common/finished_slide.rb"