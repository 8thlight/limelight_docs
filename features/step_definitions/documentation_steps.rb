Then /^the "([^\"]*)" should be open$/ do |section_id|
  $scene.find(section_id).should be_open
end

Then /^I should see that I am on step "([^\"]*)"$/ do |step_number|
  slideshow = $scene.find("slideshow")
  slideshow_progress = $scene.find("slideshow_progress")
  slideshow_progress.children[1].text.should match(/#{step_number}\/#{slideshow.num_slides}/)
end

Then /^I should have "([^\"]*)" search results$/ do |count|
  results = $scene.find("search_results_screen")
  results.should_not be_nil
  results.children.size.should == count.to_i
end

Then /^I should have "([^\"]*)" class in search results$/ do |arg1|
  pending
end
