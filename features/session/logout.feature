Feature: Logout
  As a member of the Berkeley Food Collective
  I want to be able to click a logout button
  So that I can logout the application

  Background: Database is loaded with test users
    Given the following users in the database
      | name             | email                     |
      | Roberto Cardenas | robertocardenas@bsfc.coop |
      | Andrew Mo        | andrewmo@bsfc.coop        |

    When I start on the login page

  Scenario: User inputs an email that is in the database
    When I fill in "session_email" with "robertocardenas@bsfc.coop"
    And I press "Login"
    Then I should see "Announcements"


  Scenario: User inputs an email that is not in the database
    When I fill in "session_email" with "roberto@roberto.com"
    And I press "Login"
    Then I should see "Please enter a valid email address!"