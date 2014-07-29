Feature: Login feature

As a User, I want to be able to log in and out of the site
so that I can administrate my bookings and keep the site secure

  Background:
    Given I am on the homepage
    And a valid user called "Jim" exists
    
  Scenario: Successful login
    When I log in as "Jim"
    Then I am on the homepage
    And I should see "Logged in as Jim"

  Scenario: Successful logout
    When I am logged in as "Jim"
    And I follow "Log out"
    Then I am on the homepage
    And I should see "Log in"