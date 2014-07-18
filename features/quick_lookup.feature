Feature: A User can quickly view today's boat bookings

As a User, I want to be able to see if I can book the 
boat today so that I can take advantage of an unexpected 
sunny day off

  Scenario: Arriving at the homepage
    Given the following bookings exist for today:
      | From  | To    |
      | 06:00 | 12:30 |
      | 12:30 | 14:00 |
      | 22:15 | 23:59 |
    And I am on the homepage
    Then I should see today's date
    And the bookings list should include:
      | From  | To    |
      | 06:00 | 12:30 |
      | 12:30 | 14:00 |
      | 22:15 | 23:59 |


