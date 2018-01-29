Feature: Validating the system authentication of Riachuelo e-commerce
  As an user
  I want to login to system
  so that to manage my account

  Scenario: Login with an invalid CPF
    Given I access the Riachuelo website
    When I click on Register icon
    And fill CPF "12345678900"
    And click on Continuar
    Then should display the error message "You have entered invalid CPF."

  Scenario: Login with a non-existing CPF
    Given I access the Riachuelo website
    When I click on Register icon
    And fill CPF "33881814205"
    And click on Continuar
    Then my registration should be transfered to register page

  Scenario: Login with valid credentials
    Given I access the Riachuelo website
    When I click on Register icon
    And fill CPF "59171827870"
    And click on Continuar
    And fill password "quejao1234"
    And click on Continuar
    Then should see the label "Minha Conta - Loja Online"