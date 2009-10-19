Feature: RDoc search
  In order to find the documentation I need
  As a user
  I want to search RDoc

  Scenario: Empty Search Criteria
    Given I click the prop "RDoc"
    When I type "" in the prop "search_box"
    Then I should have "0" search results
  
  Scenario: Finding one Class
    Given I click the prop "RDoc"
    When I type "animation" in the prop "search_box"
    Then I should have "1" class in search results
