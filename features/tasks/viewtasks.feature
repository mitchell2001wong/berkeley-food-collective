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
      | name                   | description            | category | priority | added      | user_add         | complete_time | user_complete | completed |
      | Count cash in register | do this asap please!   | Register | 3        | 2001-01-01 | Roberto Cardenas |               |               | false |
      | Finished task          | someone completed this | Register | 3        | 2001-01-01 | Roberto Cardenas |   2001-01-02  | Andrew Mo     | true |
      | low priority 1         | low pri description 1  | Register | 1        | 2001-01-01 | Roberto Cardenas |               |               | false |
      | low priority 2         | low pri description 2  | Register | 1        | 2001-01-01 | Roberto Cardenas |               |               | false |
      | med priority           | med pri description 1  | Register | 2        | 2001-01-01 | Roberto Cardenas |               |               | false |

    When I start on the login page
    And I fill in "session_email" with "robertocardenas@bsfc.coop"
    And I press "Login"
    And I go on the tasks page

  Scenario: All tasks and descriptions show up
    Then I should see "Count cash in register"
    Then I should see "Finished task"
    Then I should see "low priority 1"
    Then I should see "low priority 2"
    Then I should see "med priority"

  Scenario: Incomplete tasks show up above complete tasks
    Then "Incomplete Tasks" should appear before "Completed Tasks"
    And "Incomplete Tasks" should appear before "Count cash in register"
    And "Completed Tasks" should appear before "Finished task"

  Scenario: Tasks show up in priority order
    Then "Count cash in register" should appear before "low priority 1"
    Then "Count cash in register" should appear before "low priority 2"
    Then "med priority" should appear before "low priority 1"
    Then "med priority" should appear before "low priority 2"
    And "low priority 2" should appear before "Finished task"