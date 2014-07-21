Feature: Update a boat booking

  Background:
    Given the following bookings exist for today:
      | From  | To    |
      | 10:00 | 12:00 |
    And I am on the homepage
    
  Scenario: Successful update of existing boat booking for today
    When I follow "Edit"
    Then I am on the edit booking page
    And I select 14:00 from the "From" dropdown menu
    And I select 18:00 from the "To" dropdown menu
    And I press "Update"
    Then I am on the homepage
    And I should see today's date
    And I should see the flash[:notice] "Your updated booking was saved successfully"
    And the bookings list should include:
      | From  | To    |
      | 14:00 | 18:00 |
