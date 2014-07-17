Feature: A User can quickly view today's boat bookings

  Scenario: Arriving at the homepage
    Given I am on the homepage
    And the following bookings exist:
      | from                  | to                    |
      | 2014-07-14 6:00:00    | 2014-07-14 12:30:00   |
      | 2014-07-14 12:30:00   | 2014-07-14 14:00:00   |
      | 2014-07-14 22:15:00   | 2014-07-14 23:59:00   |
    Then I should see today's date
    And the bookings list should include:
      | from | to   |
      | 6    | 12   |
      | 12   | 14   |
      | 22   | 23   |

