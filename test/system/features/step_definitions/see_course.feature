Feature: I want to see course

  Background:
    Given I am at StudyKit.ru

  Scenario: I see course
      And I am on main page
     When I click "Все курсы" 
     Then I see course


  Scenario: I see info about course without login
      And I am on main page
     When I click "Все курсы" 
     Then I see course
     When I click on course
     Then I see info about course

   Scenario: I not see my couse without login
      And I am on main page
     Then I not see "Мои курсы" 

   Scenario: I see couse with login
      And I am on main page
      And 
     Then I not see "Мои курсы" 