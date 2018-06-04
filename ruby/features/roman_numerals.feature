Feature: Converting between Roman and Arabic numerals
  Roman numerals use the latin alphabet to build numbers, as in "XII" (12).

  Scenario: Converting from Arabic to Roman
    Given the number 1
    When I convert it to roman
    Then I should get "I"
