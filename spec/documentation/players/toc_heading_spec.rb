require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe "TocHeading" do
  with_stubbed_doc_loader do
    uses_scene :documentation

    before(:each) do
      @rdoc_link = scene.find("RDoc")
    end

    describe "rdoc disabled" do
      it "should not do anything if it is disabled" do
        @rdoc_link.style.add_extension(@rdoc_link.disabled_style)
        @rdoc_link.style.remove_extension(@rdoc_link.selected_style)
    
        toc_links = mock("prop")
        toc_links.should_not_receive(:build)
        toc_links.should_not_receive(:remove_all)
        scene.stub!(:find).and_return(toc_links)
    
        @rdoc_link.mouse_clicked(nil)
      end
    end

    describe "clicking rdoc" do
      before(:each) do
        @rdoc_link.enable
        @rdoc_link.mouse_clicked(nil)
      end
  
      it "should select the rdoc" do
        @rdoc_link.should have_style_extension("selected_toc_heading")
      end

      it "should remove the unselected stye from the rdoc" do
        @rdoc_link.should_not have_style_extension("unselected_toc_heading")
      end

      it "should add the unselected_toc_heading to walkthrough" do
        scene.find("Walkthrough").should have_style_extension("unselected_toc_heading")
      end
  
      it "should remove the selected from walkthrough" do
        scene.find("Walkthrough").should_not have_style_extension("selected_toc_heading")
      end
  
      describe "clicking rdoc then clicking walkthrough" do
        before(:each) do
          @walkthrough = scene.find("Walkthrough")
          @walkthrough.mouse_clicked(nil)
        end

        it "should unselect the rdoc" do
          @rdoc_link.should have_style_extension("unselected_toc_heading")
        end

        it "should unselect the rdoc" do      
          @walkthrough.should have_style_extension("selected_toc_heading")
        end
      end

      describe "Showing RDoc Content" do
        before(:each) do
          @toc_links = scene.find('toc_links')
        end

        it "should load the rdoc page when clicked" do
          scene.find_by_name("rdoc_links").should_not be_empty
        end

        it "should should not have any walkthrough links" do
          @toc_links.find_by_name('toc_link').should be_empty
        end

        it "should reinstall the walkthrough links when you click walkthrough" do
          click_walkthrough_tab

          @toc_links.find_by_name('tutorial_link').should_not be_empty
        end

        it "should not do anything if it is already the selected heading" do
          toc_links = mock("prop")
          toc_links.should_not_receive(:build)
          toc_links.should_not_receive(:remove_all)
          scene.stub!(:find).with("toc_links").and_return(toc_links)

          @rdoc_link.mouse_clicked(nil)
        end

        it "should clear the content pane when a new tab is selected" do
          Entrance.cue_tutorial scene, :animations

          click_walkthrough_tab

          content_pane_should_be_childless
        end

        def content_pane_should_be_childless
          #EWM - empty_prop is not a real prop.  It is only used to handle the redraw bug
          scene.find('content_pane').children.should == [scene.find_by_name("empty_prop")[0]]
        end

        def click_walkthrough_tab
          @walkthrough = scene.find("Walkthrough")
          @walkthrough.mouse_clicked(nil)
        end
      end
    end
  end
end