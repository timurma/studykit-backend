Feature: I want to login in StudyKit

  Background:
    Given I am at StudyKit.com

  Scenario Outline: I login Govermedia with error
    Given I am on form login
     Then I click "Войти"
      And I type <email>
      And I type <password>
     Then I click button Войти
     When I am see error with text <error_text>

    Examples:
    | email | password | error_text |
    | "correct_email@gmail" | " " | "Не все поля заполнены!" |
    | " " |"correct_password" | "Не все поля заполнены!" |
    | "incorrect_email@gmail" | "correct_password" | "Неверно заполнен email! " |
    | "incorrect_email.com" | "correct_password" | "Неверно заполнен email!" |
    | "unregister_email@gmail.com" | "correct_password" | "Пользователь не найден!" |
    | "incorrect_email@gmail.com" | "correct_password" | "Пароль неверный!" | 

Scenario Outline: I login Govermedia with correct data
    Given I am on form login
      And I type <email>
      And I type <password>
     Then I click "Войти"
     When I am main page
    
    Examples:
    | email | password |
    | "correct_email@gmail.com" | "correct_password" |