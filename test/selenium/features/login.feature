Feature: I want to login in StudyKit

  Background:
    Given I am at StudyKit.com

  Scenario Outline: I login StudyKit with error
      And I click "Войти"
    Given I am on form login
      And I type email with <email>
      And I type password with <password>
     Then I login
     When I am see error with text <error_text>

    Examples:
    | email | password | error_text |
    | "correct_email@gmail" | " " | "Не все поля заполнены!" |
    | " " |"correct_password" | "Не все поля заполнены!" |
    | "incorrect_email@gmail" | "correct_password" | "Неверно заполнен email! " |
    | "incorrect_email.com" | "correct_password" | "Неверно заполнен email!" |
    | "unregister_email@gmail.com" | "correct_password" | "Пользователь не найден!" |
    | "incorrect_email@gmail.com" | "correct_password" | "Пароль неверный!" | 

Scenario Outline: I login StudyKit with correct data
    Given I am on form login
      And I type email with <email>
      And I type password with <password>
     Then I login
     When I am main page
    
    Examples:
    | email | password |
    | "correct_email@gmail.com" | "correct_password" |