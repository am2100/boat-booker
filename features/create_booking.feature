Feature: Create a boat booking

  Background:
    Given the following bookings exist:
      | date       | from  | to    | user      |
      | 20/07/2014 | 10:00 | 11:00 | Deana     |
      | 21/07/2014 | 10:00 | 12:00 | Sebastian |
      | 21/07/2014 | 15:00 | 20:00 | Jim       |
      | 28/07/2014 | 12:00 | 16:00 | Roger     |
    And I am logged in as Jim
    And I am on the homepage
    
  Scenario: Successful boat booking for today
    When I follow "Create new booking"
    Then I am on the create new booking page
    And I select 23/07/2014 from the date dropdown menus
    And I select 14:00 from the "From" dropdown menu
    And I select 18:00 from the "To" dropdown menu
    And I press "Book it!"
    Then I am on the homepage
    And I should see the flash[:notice] "Your booking was saved successfully"
    And the bookings list should include:
      | Date       | From  | To    | Skipper   |
      | 20/07/2014 | 10:00 | 11:00 | Deana     |
      | 21/07/2014 | 10:00 | 12:00 | Sebastian |
      | 21/07/2014 | 15:00 | 20:00 | Jim       |
      | 23/07/2014 | 14:00 | 18:00 | Jim       |
      | 28/07/2014 | 12:00 | 16:00 | Roger     |