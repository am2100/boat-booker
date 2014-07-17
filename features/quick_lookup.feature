Feature: A User can quickly view today's boat bookings

  Scenario: Arriving at the homepage
    Given I am on the homepage
    And the following bookings exist:
      | from | to   |
      | 6    | 12   |
      | 12   | 14   |
      | 22   | 23   |
    Then I should see today's date
    And the bookings list should include:
      | from | to   |
      | 6    | 12   |
      | 12   | 14   |
      | 22   | 23   |

