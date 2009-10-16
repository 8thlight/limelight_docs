Then /^the "([^\"]*)" should be open$/ do |section_id|
  $scene.find(section_id).should be_open
end