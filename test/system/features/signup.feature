Feature: I want to sign up in StudyKit

  Background:
    Given I am at StudyKit.com

  Scenario Outline: I sign up StudyKit with error
      And I click "Войти"
     Then I change login form
    Given I am on form sign up
      And I type name with <name>
      And I type surname with <surname>
      And I type email with <email>
      And I type password with <password>
     Then I sign up
     When I am see message with text <error_text>

    Examples:
    | name | surname | email | password | error_text |
    # | "" | "surname" | "correct_email@gmail.com" | "correct_password" | "Не все поля заполнены!" |
    # | "name" | "" | "correct_email@gmail.com" | "correct_password" | "Не все поля заполнены!" |
    # | "name" | "surname" | "" | correct_password | "Не все поля заполнены!" |
    # | "name" | "surname" | "correct_email@gmail.com" | "" | "Не все поля заполнены!" |
    # | "name" | "surname" | "incorrect_email@gmail" | correct_password | "Неверно заполнен email!" |
    # | "name" | "surname" | "incorrect_email.com" | correct_password | "Неверно заполнен email!" |
    | "name" | "surname" | "yet_correct_email@gmail.com" | "correct_password" | "Пользователь с таким email уже зарегистрирован" |

Scenario Outline: I sign up StudyKit with correct data
      And I click "Войти"
     Then I change login form
    Given I am on form sign up
      And I type name with <name>
      And I type surname with <surname>
      And I type email with <email>
      And I type password with <password>
     Then I sign up
     When I am see message with text <text>
    
    Examples:
    | name | surname | email | password | text|
    | "name" | "surname" | "yet_correct_email@gmail.com" | "correct_password" | "Успешная регистрация" |