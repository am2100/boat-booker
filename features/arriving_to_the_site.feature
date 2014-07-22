Feature: The homepage shows a list of existing bookings

As a User I want to see a list of future boat bookings
ordered nearest to furthest in time
so I can quickly review boat availability

  Scenario: Arriving at the homepage
    Given the following bookings exist:
      | date       | from  | to    | user      |
      | 20/07/2014 | 10:00 | 11:00 | Deana     |
      | 21/07/2014 | 10:00 | 12:00 | Sebastian |
      | 21/07/2014 | 15:00 | 20:00 | Jim       |
      | 28/07/2014 | 12:00 | 16:00 | Roger     |
    And I am on the homepage
    Then I should see Bookings
    And the bookings list should include:
      | Date       | From  | To    | Skipper   |
      | 20/07/2014 | 10:00 | 11:00 | Deana     |
      | 21/07/2014 | 10:00 | 12:00 | Sebastian |
      | 21/07/2014 | 15:00 | 20:00 | Jim       |
      | 28/07/2014 | 12:00 | 16:00 | Roger     |
