Feature: Converting between Roman and Arabic numerals
  Roman numerals use the latin alphabet to build numbers, as in "XII" (12).

  Scenario Outline: Converting from Arabic to Roman
    Given the arabic number <arabic>
    When I convert it to roman
    Then I should get "<roman>"

  Examples:
  | arabic | roman |
  | 1      | I     |

