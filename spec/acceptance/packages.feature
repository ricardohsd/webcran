Feature: Search packages

  Scenario: Searching packages
    Given I'm in the root page
    And there are some packages
    When I search for a package
    Then I should see if the package exists
