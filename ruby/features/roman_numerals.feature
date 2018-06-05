Feature: Converting between Roman and Arabic numerals
  Roman numerals use the latin alphabet to build numbers, as in "XII" (12).

  Scenario Outline: Converting from Arabic to Roman
    Given the arabic number <arabic>
    When I convert it to roman
    Then I should get "<roman>"

  Examples:
  | arabic | roman |
  | 1      | I     |
  | 2      | II    |
  | 3      | III   |
  | 4      | IV    |
  | 5      | V     |
  | 6      | VI    |
  | 7      | VII   |
  | 8      | VIII  |
  | 9      | IX    |

