slide do
  heading :text => "Developing In Limelight"
  directions :text => "So you've seen Limelight and now you want to develop in it.  You're one of the cool kids.  Let's get you started.  To follow this tutorial simply click the next arrow in the top right corner and follow the directions on each page."
end

slide do
  heading :text => "1. Installing JRuby"
  directions :text => "Limelight is a JRuby application, and you'll need it installed and in your path in order to run.  The button below will take you to the JRuby website, where you can find the instructions."

  jruby_button do
    link :text => "Click Me", :url => "http://www.jruby.org", :styles => "green_button"
  end
end

slide do
  heading :text => "2. Verify Installation"
  directions :text => "When you've completed the installation go to your command prompt (cmd.exe on Windows - Terminal on a Mac) and type:"
  codeblock do
    code :text => "jruby -V"
  end

  directions :text => "If you see output like:"
  codeblock do 
    code :text => "jruby 1.3.1 (ruby 1.8.6p287) (2009-06-15 2fd6c3d) (Java HotSpot(TM) 64-Bit Server VM 1.6.0_13) [x86_64-java]"
  end

  directions :text => "then continue to the next step. Otherwise return to the JRuby website and double-check the instructions."
#    verify_jruby_button :id => "verify_jruby", :text => "Verify", :styles => "green_button"
end

slide do
  heading :text => "3. Installing Limelight"
  directions :text => "Next we need toto install the Limelight gem.  In the command prompt you opened before type:"
  codeblock do
    code :text => "jruby -S gem install limelight"
  end

  directions :text => "On successful completion you should see a message like this:"
  codeblock do
    code :text => "Successfully installed limelight-0.4.0-java"
    code :text => "1 gem installed"
    code :text => "Installing ri documentation for limelight-0.4.0-java..."
    code :text => "Installing RDoc documentation for limelight-0.4.0-java..."
  end
end

slide do
  heading :text => "4. Your First Limelight App"
  directions :text => "Now that you've installed the gem you can create your first Limelight app.  At that same command prompt go to the directory of your choosing and type:"
  codeblock do
    code :text => "limelight create production hello_limelight"
  end

  directions :text => "Verify that the application was created correctly by then typing:" 
  codeblock do
    code :text => "limelight open hello_limelight"
  end

  directions :text => "If you see an application like this you're ready to get started: "
  screenshot_div do
    screenshot :image => "images/screenshot.jpg", :height => 300, :scaled => false, :players => "image"
  end
end

slide do
  heading :text => "5. Running Tests"
  directions :text => "Before we change our behavior we should run our tests to make sure they all pass.  Limelight uses RSpec for all its testing, so go to the hello_Limelight directory and run:"
  codeblock do
    code :text => "jruby -S spec spec"
  end
  
  directions :text => "You should see something like this:"
  codeblock do
    code :text => "."
    code :text => ""
    code :text => "Finished in 0.36 seconds"
    code :text => ""
    code :text => "1 example, 0 failures"
  end
  
  directions :text => "Good.  Now let's break them."
end

slide do
  heading :text => "6. Tests First"
  directions :text => "We need to change that passing test to reflect the scene we want to see.  In your project open spec/default_scene/default_scene_spec.rb.  There you'll find one test that looks like this:"
  
  codeblock do
    code :text => "it 'should have default text' do"
    code :text => "  scene.children.size.should == 1"
    code :text => "  root = scene.children[0]"
    code :text => "  root.text.should == 'This is the Default Scene scene.'"
    code :text => "end"
  end
  
  directions :text => "Change the text from \"This is the Default Scene\" scene to \"Click Me!\"  Now run the tests again so you see this:"
  codeblock do
    code :text => "F"
    code :text => ""
    code :text => "1)"
    code :text => "'Default Scene should have default text' FAILED"
    code :text => "expected: \"Click Me!\","
    code :text => "     got: \"This is the Default Scene scene.\" (using ==)"
    code :text => "/Users/eric/Projects/limelight_projects/hello_limelight/spec/default_scene/default_scene_spec.rb:10:"
    code :text => ""
    code :text => "Finished in 0.408 seconds"
    code :text => ""
    code :text => "1 example, 1 failure"
  end
end

slide do
  heading :text => "7. Text Attribute"
  directions :text => "A failing test should never stay faling for very long.  Let's change that prop to match the expectation we set in the test.  Open the props.rb file in the default_scene directory.  There you'll see our prop:"
  codeblock do
    code :text => "root :text => \"This is the Default Scene scene.\""
  end
  
  directions :text => "The text attribute tells the prop root to display the text you see on the screen.  To make our spec pass simple change it to this:"
  codeblock do
    code :text => "root :text => \"Click Me!\""
  end
  
  directions :text => "Run the tests again to verify that your tests pass.  If they fail make sure the string in your spec matches the text attribute of the prop."
end

slide do
  heading :text => "8. A Mouse Click"
  directions :text => "Okay we've changed the text, but we can do better than that.  Let's make the text respond to a mouse click.  Go back to the spec file and create a second block below the previous one that looks like this:"
  
  codeblock do
    code :text => "it 'should change the root scene text when it is clicked' do"
    code :text => "  root = scene.children[0]"
    code :text => "  root.mouse_clicked(nil)"
    code :text => "  root.text.should == \"Hello Limelight!\""
    code :text => "end"
  end
  
  directions :text => "This test probably requires some explanation.  The method scene is provided by the test harness so you can access the current scene in your specs.  The scene prop is the root prop for the scene - so it's first and only child is the prop we've created - root.  When the mouse is clicked on that prop the method mouse_clicked is called, and we expect the text to change to \"Hello Limelight!\" Make sure you run the specs and see them fail.  Go ahead I'll wait."
  codeblock do
    code :text => ".F"
    code :text => ""  
    code :text => "1)"
    code :text => "NoMethodError in 'Default Scene should change the root scene text when it is clicked'"
    code :text => "undefined method `mouse_clicked' for Limelight::Prop[id: , name: root]:Limelight::Prop"
    code :text => ""
    code :text => ""
    code :text => "Finished in 0.383 seconds"
    code :text => ""
    code :text => "2 examples, 1 failure"
  end
end

slide do
  heading :text => "9. Get to Green"
  directions :text => "We need to make that test pass - let's add mouse_click behavior to the prop.  Change your prop to match this"
  codeblock do
    code :text => "root :text => \"Click Me!\", :on_mouse_clicked => \"self.text = 'Hello Limelight!'\""
  end
  
  directions :text => "Run those tests again, they should pass.  Go ahead and open your Limelight app again.  You should be able to click the \"Click Me!\" text and see it change to \"Hello Limelight!\""
end

slide do
  heading :text => "10. A Pretty Prop"
  directions :text => "Okay you've made the scene interactive - now let's make that a little more interesting.  Props can have styles, and we can go ahead and use those to make a prettier prop.  Open your props.rb file again and make it look like this:"
  codeblock do
    code :text => "root :text => \"Click Me!\"," 
    code :text => "     :rounded_corner_radius => 10, :padding => 10,"
    code :text => "     :background_color => '#fffa',"
    code :text => "     :secondary_background_color => '#fff6',"
    code :text => "     :gradient => :on, :gradient_angle => 270,"
    code :text => "     :font_size => 28," 
    code :text => "     :on_mouse_clicked => \"self.text = 'Hello Limelight!'\""
  end
  
  directions :text => "After making those changes close and reopen your application.  You should have something that looks like this after you click \"Click Me!\":"
  screenshot_div do
    screenshot :image => "images/screenshot2.jpg", :players => "image"
  end
end

slide do
  heading :text => "11. Your Turn"
  directions :text => "Congratulations!  You've created your first Limelight application.  Feel free to play and experiment with it and when you're ready, head to the next tutorial."
end