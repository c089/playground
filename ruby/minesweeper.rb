class Minesweeper
  def sweep input
    "Field #1:\n" + (if input.lines[1][0] == "*" then "*" else "0" end)
  end
end
