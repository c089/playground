Feature: Minesweeper Kata

  Scenario: Sweeping two minefields
    Given some minefields
      """
      4 4
      *...
      ....
      .*..
      ....
      3 5
      **...
      .....
      .*...
      0 0
      """

    When I sweep the fields

    Then I should see the minefields with hint numbers:
      """
      Field #1:
      *100
      2210
      1*10
      1110

      Field #2:
      **100
      33200
      1*100
      """

        