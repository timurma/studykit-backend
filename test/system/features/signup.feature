
Feature: Sign Up

  Background:
    Given I am at StudyKit.ru

  Scenario Outline: I want to sign up
      And I click button "Войти"
      And I click "Регистрация"
    Given I am on form sign up
      And I fill in "firstName" with <firstName>
      And I fill in "lastName" with <lastName>
      And I fill in "email" with <email>
      And I fill in "password" with <password>
     When I click button "Зарегистрироваться"
     Then I see message with text <message_text>

    Examples:
    | firstName | lastName | email | password | message_text |
    | "" | "surname" | "correct_email@gmail.com" | "correct_password" | "Пожалуйста, заполните это поле." |
    | "name" | "" | "correct_email@gmail.com" | "correct_password" | "Пожалуйста, заполните это поле." |
    | "name" | "surname" | "" | correct_password | "Пожалуйста, заполните это поле." |
    | "name" | "surname" | "correct_email@gmail.com" | "" | "Пожалуйста, заполните это поле." |
    | "name" | "surname" | "incorrect_email@gmail" | correct_password | "Неверно заполнен email!" |
    | "name" | "surname" | "incorrect_email.com" | correct_password | "Неверно заполнен email!" |
    | "name" | "surname" | "yet_correct_email@gmail.com" | "correct_password" | "Пользователь с таким email уже зарегистрирован" |
    | "name" | "surname" | "new_correct_email@gmail.com" | "correct_password" | "Успешная регистрация" |

# Scenario Outline: I sign up StudyKit with correct data
#       And I click "Войти"
#      Then I change login form
#     Given I am on form sign up
#       And I fill in "name" with <name>
#       And I fill in "surname" with <surname>
#       And I fill in "email" with <email>
#       And I fill in "password" with <password>
#      When I sign up
#      Then I am see message with text <text>
    
#     Examples:
#     | name | surname | email | password | text|
#     | "name" | "surname" | "new_correct_email@gmail.com" | "correct_password" | "Успешная регистрация" |