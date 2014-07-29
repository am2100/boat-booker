Feature: Login feature

As a User, I want to be able to log in and out of the site
so that I can administrate my bookings and keep the site secure

  Background:
    Given I am on the homepage
    And a valid user called "Jim" exists
    
  Scenario: Successful login
    When I follow "Log in"
    And I am on the login page
    And I fill in "name" with "Jim"
    And I fill in "password" with "banana"
    And I press "Log in"
    Then I am on the homepage
    And I should see "Logged in as Jim"


  Scenario: Successful logout