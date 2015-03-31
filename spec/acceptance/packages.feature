Feature: Search packages

  Background:
    Given I'm in the root page

  Scenario: Searching packages
    Given there are some packages
    When I search for a package
    Then I should see if the package exists

  Scenario: Navigating through the packages
    Given there are some packages
    When I click in a package dependency that exists
    Then I should see the dependent package page

  Scenario: Clicking in a unexistent dependency
    Given there are some packages
    When I click in a unexistent package dependency
    Then I should see a alert about the unexistent package
