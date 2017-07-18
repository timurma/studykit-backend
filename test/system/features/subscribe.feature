Feature: I want to subscribe course

  Background:
    Given I am at StudyKit.ru

  Scenario: I not may to subscribe course without login
      And I not login
      And I click "Все курсы" 
      And I see course
     When I click on course
     Then I see button for subscribe
      And I subscribe
     Then I see button for subscribe


  Scenario: I may to subscribe course with login
      And I login
      And I click "Все курсы" 
      And I see course
     When I click on course
     Then I see button for subscribe
      And I subscribe
     Then I see button for unsubscribe

  Scenario: I not may to subscribe my course with login
      And I login
      And I click "Мои курсы" 
      And I see course
     When I click on course
     Then I see button for unsubscribe