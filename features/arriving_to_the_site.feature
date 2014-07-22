Feature: The homepage shows a list of existing bookings

As a User I want to see a list of future boat bookings
ordered nearest to furthest in time
so I can quickly review boat availability

  Scenario: Arriving at the homepage
    Given the following bookings exist:
      | date       | user      | from  | to    |
      | 20/07/2014 | Deana     | 10:00 | 11:00 |
      | 21/07/2014 | Sebastian | 10:00 | 12:00 |
      | 21/07/2014 | Jim       | 15:00 | 20:00 |
      | 28/07/2014 | Roger     | 12:00 | 16:00 |
    And I am on the homepage
    Then I should see Bookings
    And the bookings list should include:
      | Date       | User      | From  | To    |
      | 20/07/2014 | Deana     | 10:00 | 11:00 |
      | 21/07/2014 | Sebastian | 10:00 | 12:00 |
      | 21/07/2014 | Jim       | 15:00 | 20:00 |
      | 28/07/2014 | Roger     | 12:00 | 16:00 |
