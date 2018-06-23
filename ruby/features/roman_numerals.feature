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
  | 5      | V     |
  | 6      | VI    |
  | 7      | VII   |
  | 10     | X     |
  | 11     | XI    |
  | 12     | XII   |
  | 13     | XIII  |

