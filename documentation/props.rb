title_bar do
  scene_title
end

main_body do
  
navigation_column do

  panel do
    tabbed_panel_cap do
      toc_heading :id => "Walkthrough", :text => "Walkthroughs", :styles => "left_toc_heading, selected_toc_heading, panel_title"
      toc_heading :id => "RDoc",:text => "RDoc", :styles => "right_toc_heading, disabled_toc_heading, panel_title"
    end
    panel_body do
      toc_links :id => "toc_links" do
        arbitrary_wrapper :id => "arbitrary_wrapper" do
          __install "documentation/walkthrough_links.rb"
        end
      end
    end
  end

end

main_column do

  panel do
    panel_cap do
      panel_title :text => ""
    end
    panel_body :id => "content_pane", :padding => 5 do
      middle_navigation :text => "Welcome to Limelight"
      heading :text => "Choose one the of Tutorials on the left."
    end
  end
  
end

end