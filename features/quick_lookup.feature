Feature: A User can quickly view today's boat bookings

  Scenario: Arriving at the homepage
    Given the following bookings exist for today:
      | from  | to    |
      | 6:00  | 12:30 |
      | 12:30 | 14:00 |
      | 22:15 | 23:59 |
    And I am on the homepage
    Then I should see today's date
    And the bookings list should include:
      | from  | to    |
      | 6:00  | 12:30 |
      | 12:30 | 14:00 |
      | 22:15 | 23:59 |


