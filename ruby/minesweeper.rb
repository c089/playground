class Minesweeper
  def sweep_square square
    if square == "*"
      "*"
    elsif square == "."
      "0"
    else
      ""
    end
  end

  def sweep input
    field = input.lines[1]
    result = "Field #1:" + "\n"

    square = field[0]
    result += sweep_square(square)

    square = field[1]
    result += sweep_square(square)

    result
  end
end
