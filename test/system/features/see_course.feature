Feature: I want to see course

  Background:
    Given I am at StudyKit.ru

  Scenario: I see course without login
    Given I not login
      And I am on main page
     When I click "Все курсы" 
     Then I see course


  Scenario: I see info about course without login
    Given I not login
      And I am on main page
     When I click "Все курсы" 
     Then I see course
     When I click on course
     Then I see info about course

   Scenario: I not see my couse without login
    Given I not login
      And I am on main page
     Then I not see "Мои курсы" 

   Scenario: I see couse with login
     Given I login
       And I am on main page
      When I click "Все курсы" 
      Then I see course

    Scenario: I see info about course with login
     Given I login
       And I am on main page
      When I click "Все курсы" 
      Then I see course
      When I click on course
      Then I see info about course

    Scenario: I not see my couse with login
      And I am on main page
      When I click "Мои курсы" 
      Then I see course
