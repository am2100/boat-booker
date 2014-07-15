Feature: A User can quickly view today's boat bookings

  Scenario: Arriving at the homepage
    Given I am on the homepage
    And the following bookings exist:
      | name    | from | to   |
      | Jim     | 0600 | 1200 |
      | Jacqui  | 1200 | 1400 |
      | Zebedee | 2300 | 0000 |
    Then I should see today's date
    And the bookings list should include:
      | Jim     | 0600 | 1200 |
      | Jacqui  | 1200 | 1400 |
      | Zebedee | 2300 | 0000 |
