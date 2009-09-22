module LimelightDocSteps
  EXAMPLE_RDOC_DIRECTORIES_ROOT = File.join(File.dirname(__FILE__), "..", "..", "example_rdoc_directories")
end


When /^I generate the limelight props for "([^\"]*)" in "([^\"]*)" directory$/ do |class_name, directory_name|
  init_paths_from(class_name, directory_name)
  generate_limelight_rdoc
  store_props
  remove_directory
end

Then /^I should have the following prop dsl$/ do |prop_dsl|
  @generated_prop_dsl.should == prop_dsl
end

Then /^I should have the following table of contents/ do |prop_dsl|
  @generated_toc_contents.should == prop_dsl
end

def init_paths_from(class_name, directory_name)
  @directory_path ||= File.expand_path(File.join(LimelightDocSteps::EXAMPLE_RDOC_DIRECTORIES_ROOT, directory_name))
  @doc_path = File.join(@directory_path, "doc")
  @class_path = File.join(@doc_path, "#{class_name}.rb")
  @toc_path = File.join(@doc_path, "toc.rb")
end

def store_props
  @generated_prop_dsl = IO.read(@class_path)
  @generated_toc_contents = IO.read(@toc_path)
end

def remove_directory
  FileUtils.rm_rf(@doc_path)
end

def generate_limelight_rdoc
  LimelightRDoc.document(["--output=#{@doc_path}", "--fmt=limelight", @directory_path])
end