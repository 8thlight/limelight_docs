walkthrough :id => "walkthrough" do
  previous_button(:id => "previous", :players => "image", :image => "images/previous.png", :scaled => false)
  next_button :id => "next", :players => "image", :image => "images/next.png", :scaled => false

  slideshow :id => "slideshow" do  
    slide do
      heading :text => "Developing In Limelight"
      directions :text => "So you've seen Limelight and now you want to develop in it.  You're one of the cool kids.  Let's get you started.  To follow this tutorial simply click the next arrow in the top right corner and follow the directions on each page.  Click the arrow to get started."
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
      directions :text => "The next order of business is to install the Limelight Gem.  In the command prompt you opened before type:"
      codeblock do
        code :text => "jruby -S gem install limelight"
      end
    
      directions :text => "On successful completion you should see a message like this:"
      codeblock do
        code :text => "Successfully installed limelight-0.3.1-java"
        code :text => "1 gem installed"
        code :text => "Installing ri documentation for limelight-0.3.1-java..."
        code :text => "Installing RDoc documentation for limelight-0.3.1-java..."
      end
    end

    slide do
      heading :text => "4. Your First Limelight App"
      directions :text => "Now that you've installed the gem you can create your first limelight app.  At that same command prompt go to the directory of your choosing and type:"
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
      heading :text => "5. Hello Limelight"
      directions :text => "You have the default scene running, but that's hardly fun.  Close that application and let's make a Hello Limelight application.  First you'll need to open the directory you created in step 4 in your favorite code editor.  Open the props.rb file in the default_scene.  You'll see this:"
      codeblock do
        code :text => "root :text => \"This is the Default Scene scene.\""
      end
    
      directions :text => "We could change that to read 'Hello World!' but that's not useful.  Instead let's change the button to say Click Me and change its text when it's clicked.  First change the text to read:"
      codeblock do
        code :text => "root :text => \"Click Me!\""
      end
    
      directions :text => "When you've changed the code reopen the application and make sure your change took effect, then proceed to the next step."
    end
  
    slide do
      heading :text => "6. A Player"
      directions :text => "In order to add behaviors to props on the stage you need to create a player.  Fortunately that's simple.  The default_scene directory has another subdirectory underneath it named players.  In that directory create a file called root.rb, which will automatically add a player to any props named root.  Type the following code:"
      codeblock do
        code :text => "module Root"
        code :text => "  def mouse_clicked(e)"
        code :text => "    self.text = 'Hello World!'"
        code :text => "  end"
        code :text => "end"
      end
    
      directions :text => "Save that file, then reopen your new limelight production and click the link.  Then move to the next step."
    end
  
    slide do
      heading :text => "7. A Pretty Player"
      directions :text => "Okay you've made some interactivity - now let's make that a little more interesting.  Open the styles.rb file in the default_scene directory and edit the root style.  It can look like this:"
      codeblock do
        code :text => "rounded_corner_radius 10"
        code :text => "padding 10"
        code :text => "background_color \"#fffa\""
        code :text => "secondary_background_color \"#fff6\""
        code :text => "gradient :on"
        code :text => "gradient_angle 270"
      end
    
      directions :text => "After making those changes close and reopen your application.  You should have something that looks like this:"
      screenshot_div do
        screenshot :image => "images/screenshot2.jpg", :players => "image"
      end
    end
    
  end
end