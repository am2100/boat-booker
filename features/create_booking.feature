Feature: Create a boat booking

  Background:
    Given I am on the homepage
    And a valid user called "Jim" exists
    And the following bookings exist:
      | date       | from  | to    | user      |
      | 20/07/2014 | 10:00 | 11:00 | Deana     |
      | 21/07/2014 | 10:00 | 12:00 | Sebastian |
      | 21/07/2014 | 15:00 | 20:00 | Jim       |
      | 28/07/2014 | 12:00 | 16:00 | Roger     |
    
  Scenario: Successfully book the boat
    When I am logged in as "Jim"
    And I follow "Create new booking"
    Then I am on the create new booking page
    And I fill in the new booking form with "12:00", "14:00" and "20/07/2014"
    And I press "Book it!"
    Then I am on the homepage
    And I should see the flash[:notice] "Your booking was saved successfully"
    And the bookings list should include:
      | Date       | From  | To    | Skipper   |
      | 20/07/2014 | 10:00 | 11:00 | Deana     |
      | 20/07/2014 | 12:00 | 14:00 | Jim       |
      | 21/07/2014 | 10:00 | 12:00 | Sebastian |
      | 21/07/2014 | 15:00 | 20:00 | Jim       |
      | 28/07/2014 | 12:00 | 16:00 | Roger     |

  Scenario: Attempt to make a booking without being logged in
    When I follow "Create new booking"
    And I am on the login page
    And I log in as "Jim"
    Then I am on the homepage
    And I follow "Create new booking"
    And I am on the create new booking page

  Scenario: Supply a non-existent date
    When I am logged in as "Jim"
    And I follow "Create new booking"
    And I fill in the new booking form with "12:00, "14:00: and "30/02/2014"
    And I press "Book it!"
    Then I am on the create new booking page
    And I should see the flash[:warning] "Oops! Date doesn't exist. Please try again"

  Scenario: My booking overlaps with another booking
    When I am logged in as "Jim"
    And I follow "Create new booking"
    And I fill in the new booking form with "10:00", "14:00" and "20/07/2014"
    And I press "Book it!"
    Then I am on the create new booking page
    And I should see the flash[:warning] "Sorry, the boat is only available on this date between the following times: 08:00-10:00, 11:00-12:00, 14:00-22:00"