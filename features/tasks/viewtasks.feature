Feature: Viewing Tasks
  As a member of the Berkeley Food Collective
  I want to be able to view complete and incomplete tasks in priority order and filter them by category
  So that I can know what tasks have been completed and what tasks need to be done

  Background: Database is loaded with test users and tasks
    Given the following users in the database
      | name             | email                     |
      | Roberto Cardenas | robertocardenas@bsfc.coop |
      | Andrew Mo        | andrewmo@bsfc.coop        |

    Given the following tasks in the database
      | name                   | description          | category | priority | user_add         | user_complete | completed |
      | Count cash in register | do this asap please! | Register | 3        | Roberto Cardenas |               | false |

    When I start on the login page
    And I fill in "session_email" with "robertocardenas@bsfc.coop"
    And I press "Login"
    And I go on the tasks page

  Scenario: User views tasks
    Then I should see "Tasks"

