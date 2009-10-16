Feature: Progress bar
  In order to see how far along I am in a tutorial
  As a user
  I want to see a progress bar with the number of slides

  Scenario: Slide Numbers
    Given I click the prop "getting_started_walkthrough"
    Then I should see that I am on step "1"
    When I click the prop "next"
    When I click the prop "next"
    Then I should see that I am on step "3"
  
  
  