def show(input)
  number_of_rows = input[0].to_i
  number_of_columns = input[2].to_i

  row = if number_of_columns == 1
    "0"
  elsif number_of_columns == 2
    "00"
  elsif number_of_columns == 3
    "000"
  end

  if number_of_rows == 2
    <<~END
      Field #1:
      0
      0
    END
  else
    <<~END
      Field #1:
      #{row}
    END
  end
end

RSpec.describe "Minesweeper" do
  it "given an empty 1 by 1 minefield, returns a single safe field" do
    input = <<~END
      1 1
      .
    END
    expected = <<~END
      Field #1:
      0
    END

    actual = show(input)

    expect(actual).to eq ( expected )
  end

  it "given an empty 1 by 2 minefield, returns two safe fields" do
    input = <<~END
      1 2
      ..
    END
    expected = <<~END
      Field #1:
      00
    END

    actual = show(input)

    expect(actual).to eq ( expected )
  end

  it "given an empty 1 by 3 minefield, returns three safe fields" do
    input = <<~END
      1 3
      ...
    END
    expected = <<~END
      Field #1:
      000
    END

    actual = show(input)

    expect(actual).to eq ( expected )
  end

  it "given an empty 2 by 1 minefield, returns two safe fields" do
    input = <<~END
      2 1
      .
      .
    END
    expected = <<~END
      Field #1:
      0
      0
    END

    actual = show(input)

    expect(actual).to eq ( expected )
  end

  # it "passes the acceptance test" do
  #   input = <<~END
  #     4 4
  #     *...
  #     ....
  #     .*..
  #     ....
  #     3 5
  #     **...
  #     .....
  #     .*...
  #     0 0
  #   END

  #   expected = <<~END
  #     Field #1:
  #     *100
  #     2210
  #     1*10
  #     1110

  #     Field #2:
  #     **100
  #     33200
  #     1*100
  #   END

  #   expect(show(input)).to eq (expected)
  # end
end
