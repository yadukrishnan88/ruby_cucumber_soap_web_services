Feature: Users can perform the basic mathematical operations of addition, subtraction, multiplication and division through
  a SOAP request

  Background:
    Given I am posting a SOAP request to the calculator webservice

  Scenario Outline: As a user I am sending soap request to add two integers
    When I am sending addition requests for "<number_1>" and "<number_2>"
    Then I should get sum of the inputs in the response
    Examples:
      | number_1 | number_2 |
      | 10       | 12       |
      | 20       | 40       |

  Scenario Outline: As a user I am sending a soap request to multiply two numbers
    When I am sending multiplication request for "<numb_1>" and "<numb_2>"
    Then I should get product of the inputs in the response
    Examples:
      | numb_1 | numb_2 |
      | 10     | 12     |
      | 22     | 24     |

  Scenario Outline: As a user when I send any non integer input to the add soap request to get an error in the response
    When I am sending "<input_1>" and "<input_2>" to the addition soap request
    Then Instead of sum of the inputs, I should get an error in the response
    Examples:
      | input_1 | input_2 |
      | 10      | a       |
      | 5       | 0.23    |
      | abcd    | xyz     |
