Feature: Generating prop dsl from rdoc-generated ri files

  Scenario: Generating a class_name prop from the class name
    When I generate the limelight props for "SimpleRdocClass" in "simple_rdocs" directory
    Then I should have the following prop dsl
"""
class_name :text => 'SimpleRdocClass'

"""

	Scenario: Generating a class_name prop and a method_name prop
	  When I generate the limelight props for "SimpleClassWithMethod" in "simple_class_with_method" directory
	  Then I should have the following prop dsl
"""
class_name :text => 'SimpleClassWithMethod'
method_name :text => 'method_name'

"""	

	Scenario: Generating a table of contents
		When I generate the limelight props for "SimpleClassWithMethod" in "simple_class_with_method" directory
		Then I should have the following table of contents
"""
toc_entry :text => 'SimpleClassWithMethod', :class_prop_file => 'SimpleClassWithMethod.rb'

"""