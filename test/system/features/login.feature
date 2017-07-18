Feature: I want to login in StudyKit

  Background:
    Given I am at StudyKit.ru

  Scenario Outline: I login StudyKit with error
      And I click "Войти"
    Given I am on form login
      And I type email with <email>
      And I type password with <password>
     Then I click login
     When I am see message with text <error_text>

    Examples:
    | email | password | error_text |
    | "correct_email@gmail" | "" | "Не все поля заполнены!" |
    | "" |"correct_password" | "Не все поля заполнены!" |
    | "incorrect_email@gmail" | "correct_password" | "Неверно заполнен email! " |
    | "incorrect_email.com" | "correct_password" | "Неверно заполнен email!" |
    | "unregister_email@gmail.com" | "correct_password" | "Пользователь с таким email не найден!" |
    | "incorrect_email@gmail.com" | "correct_password" | "Неверный пароль" | 
    | "incorrect_email@gmail.com" | "correct_password" | "404 Ошибка подключения" | 

Scenario Outline: I login StudyKit with correct data
      And I click "Войти"
    Given I am on form login
      And I type email with <email>
      And I type password with <password>
     Then I click login
     When I am main page
    
    Examples:
    | email | password |
    | "correct_email@gmail.com" | "correct_password" |