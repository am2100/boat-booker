Feature: Create a boat booking

  Background:
    Given the following bookings exist for today:
      | From  | To    |
      | 06:00 | 12:30 |
      | 12:30 | 14:00 |
      | 22:15 | 23:59 |
    And I am on the homepage
    
  Scenario: Successful boat booking for today
    When I follow "Create new booking"
    Then I am on the create new booking page
    And I select 14:00 from the "From" dropdown menu
    And I select 18:00 from the "To" dropdown menu
    And I press "Book it!"
    Then I am on the homepage
    And I should see today's date
    And the bookings list should include:
      | From  | To    |
      | 06:00 | 12:30 |
      | 12:30 | 14:00 |
      | 14:00 | 18:00 |
      | 22:15 | 23:59 |
