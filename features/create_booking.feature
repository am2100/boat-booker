Feature: Create a boat booking

  Background:
    Given the following bookings exist:
      | date       | from  | to    | user      |
      | 20/07/2014 | 10:00 | 11:00 | Deana     |
      | 21/07/2014 | 10:00 | 12:00 | Sebastian |
      | 21/07/2014 | 15:00 | 20:00 | Jim       |
      | 28/07/2014 | 12:00 | 16:00 | Roger     |
    And I am logged in as "Jim"
    And I press "Log in"
    And I am on the login page
    And I fill in name with "Jim"
    And I fill in password with "banana"
    And I press "Log in"
    Then I am on the homepage
    And I should see "Logged in as Jim"
    
  Scenario: Successful boat booking for today
    When I follow "Create new booking"
    Then I am on the create new booking page
    And I specify my booking between "12:00" and "14:00" for "today"
    And I press "Book it!"
    Then I am on the homepage
    And I should see the flash[:notice] "Your booking was saved successfully"
    And the bookings list should include today's date, "12:00", "14:00", "Jim"