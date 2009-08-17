header do
  logo :players => "image", :image => "images/logo.png"
end

previous_button :id => "previous"
next_button :id => "next", :players => "image", :image => "images/next.png"
slideshow :id => "slideshow" do  
  slide do
    heading :text => "Developing In Limelight"
    directions :text => "So you've seen Limelight and now you want to develop in it.  You're one of the cool kids.  Now let's get you started.  To follow this tutorial simply click the next button in the top right corner and follow the directions on each page.  Some pages will have slides to verify that your system is setup properly, so make sure you follow all of the direcitons."
  end
  
  slide do
    heading :text => "1. Installing JRuby"
    directions :text => "Limelight is a JRuby application, and you'll need it installed and in your path in order to run.  The button below will take you to the JRuby website, where you can find the instructions."
    link :text => "Click Me", :url => "http://www.jruby.org", :styles => "green_button"
  end

  slide do
    heading :text => "2. Verify Installation"
    directions :text => "When you've completed the installation go to your command prompt (cmd.exe on Windows - Terminal on a Mac) and type:"
    code :text => "jruby -V"
    directions :text => "If you see output like:"
    code :text => "jruby 1.3.1 (ruby 1.8.6p287) (2009-06-15 2fd6c3d) (Java HotSpot(TM) 64-Bit Server VM 1.6.0_13) [x86_64-java]"
    directions :text => "then continue to the next step. Otherwise return to the JRuby website and double-check the instructions."
#    verify_jruby_button :id => "verify_jruby", :text => "Verify", :styles => "green_button"
  end

  slide do
    heading :text => "3. Installing Limelight"
      directions :text => "The next order of business is to install the Limelight Gem.  In the command prompt you opened before type:"
    code :text => "jruby -S gem install limelight"
    directions :text => "On successful completion you should see a message like this:"
    code :text => "Successfully installed limelight-0.3.1-java"
    code :text => "1 gem installed"
    code :text => "Installing ri documentation for limelight-0.3.1-java..."
    code :text => "Installing RDoc documentation for limelight-0.3.1-java..."
  end
  
  slide do
    heading :text => "4. Your First Limelight App"
    directions :text => "Now that you've installed the gem you can create your first limelight app.  At that same command prompt go to the directory of your choosing and type:"
    code :text => "limelight create production hello_limelight"
    directions :text => "Verify that the application was created correctly by then typing:" 
    code :text => "limelight open hello_limelight"
    directions :text => "If you see an application like this you're ready to get started: "
    screenshot :image => "images/screenshot.jpg", :height => 300, :scaled => false, :players => "image"
  end
  
end