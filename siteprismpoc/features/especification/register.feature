#language:en
Feature: Register on Riachuelo
    As an user
    I want to create my personal account
    so that to make online purchases
Background:
    Given I access the Riachuelo website
    When I click on Register icon
    And fill CPF "33881814205"
    And click on Continuar

  Scenario: Passing all valid data with tables
     And fill the form out with valid data
            |name                   |Maria Mercedez       |
            |email                  |maria@test.com       |
            |date birth             |03051980             |
            |phone                  |11999980344          |
            |alternative phone      |1134562209           |
            |password               |1234abcd             |
            |password confirmation  |1234abcd             |
      And click on process button

  Scenario: Passing blank value for Name
      When fill the name field with ""
      And click on process button
      Then should display the error message "Esse é um campo obrigatório" below "name" field

  Scenario: Passing blank value for Email
      When fill the email field with ""
      And click on process button
      Then should display the error message "Esse é um campo obrigatório" below "email" field

  Scenario: Passing blank value for Date Birth
      When fill the date birth field with ""
      And click on process button
      Then should display the error message "Esse é um campo obrigatório" below "datebirth" field

  Scenario: Passing blank value for phone
      When fill the phone field with ""
      And click on process button
      Then should display the error message "Esse é um campo obrigatório" below "phone" field

  Scenario: Passing blank value for alternative phone
      When fill the alternative phone field with ""
      And click on process button
      Then should not display the error message "Esse é um campo obrigatório" below "second_phone" field

  Scenario: Passing an invalid value for alternative phone
      When fill the alternative phone field with "1234"
      And click on process button
      Then should display the error message "Enter a valid phone number" below "second_phone" field

  Scenario: Passing blank value for password
      When fill the password field with ""
      And click on process button
      Then should display the error message "Esse é um campo obrigatório" below "password" field

  Scenario: Validating password message while it is typed
      When fill the password field with "12"
      Then should display the error message "Incluir no mínimo 8 caracteres" below "password" field

  Scenario: Passing less than 8 long characteres for password
      When fill the password field with "12345"
      And click on process button
      Then should display the error message "Minimum length of this field must be equal or greater than 8 symbols. Leading and trailing spaces will be ignored." below "password" field

  Scenario: Passing blank value for password confirmation
      When fill the password confirmation field with ""
      And click on process button
      Then should display the error message "Esse é um campo obrigatório" below "password_confirmation" field

  Scenario: Passing different values in Password and Password Confirmation
      When fill the password field with "12345678"
      When fill the password confirmation field with "456789234"
      And click on process button
      Then should display the error message "Please enter the same value again." below "password_confirmation" field


