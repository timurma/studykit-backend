Feature: I want to unsubscribe course

  Background:
    Given I am at StudyKit.ru

  Scenario: I not may to subscribe course without login
      And I not login
      And I click "Все курсы" 
      And I see course
     When I click on course
     Then I not see button for unsubscribe

  Scenario: I may to unsubscribe my course with login
      And I login
      And I click "Мои курсы" 
      And I see course
     When I click on course
     Then I see button for unsubscribe
      And I unsubscribe

  Scenario: I not may to unsubscribe course with login
      And I login
      And I click "Все курсы" 
      And I see course
     When I click on course
     Then I not see button for unsubscribe