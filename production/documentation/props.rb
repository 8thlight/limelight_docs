title_bar do
  scene_title
  activity_text :id => "activity_text", :text => ""
end

main_body do

  navigation_column do

    panel do
      toc_heading :id => "Walkthrough", :text => "Walkthroughs", :styles => "left_panel_cap, selected_toc_heading, panel_title"
      toc_heading :id => "RDoc", :text => "RDoc", :styles => "right_panel_cap, disabled_toc_heading, panel_title", :text_color => "#aaa"
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
      panel_body :id => "content_pane", :vertical_scrollbar => :on do
        __install "documentation/Walkthrough_content_pane.rb"
      end
    end

  end

end
copyrights :text => "Copyright 2009, 8th Light, Inc."