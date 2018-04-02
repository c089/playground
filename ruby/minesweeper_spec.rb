RSpec.describe "Minesweeper" do
  def is_mine(field)
    field == "*"
  end

  def is_safe(field)
    field == "."
  end

  def sweep_field(previous, current, nextField)
    if is_mine(current)
      "*"
    elsif is_mine(previous) and is_mine(nextField)
      "2"
    elsif is_mine(previous) or is_mine(nextField)
      "1"
    else
      "0"
    end
  end

  def sweep(input)
    minefield = ""
    i = input.index("\n")+1
    while i < input.length
      current = input[i]
      if current == "\n"
        minefield += "\n"
      else
        minefield += sweep_field(input[i-1], current, input[i+1])
      end
      i += 1
    end

    "Field #1:\n" + minefield
  end

  it "given a 1 by 1 minefield with no mines, returns a 0 for that field" do
    input = <<~END
      1 1
      .
    END
    expected = <<~END
      Field #1:
      0
    END
    expect(sweep(input)).to eq expected
  end

  it "given a 1 by 1 minefield with a mine, returns a * for that field" do
    input = <<~END
      1 1
      *
    END
    expected = <<~END
      Field #1:
      *
    END
    expect(sweep(input)).to eq expected
  end

  it "given a 1 by 2 minefield with no mines, return 0s" do
    input = <<~END
      1 2
      ..
    END

    expected = <<~END
      Field #1:
      00
    END

    expect(sweep(input)).to eq expected
  end

  it "given a 1 by 2 minefield full of mines, return *s" do
    input = <<~END
      1 2
      **
    END

    expected = <<~END
      Field #1:
      **
    END

    expect(sweep(input)).to eq expected
  end

  it "given a 1 by 2 minefield with a mine to the left, have a 1 right of it" do
    input = <<~END
      1 2
      *.
    END

    expected = <<~END
      Field #1:
      *1
    END

    expect(sweep(input)).to eq expected
  end

  it "given a 1 by 2 minefield with a mine to the right, have a 1 left of it" do
    input = <<~END
      1 2
      .*
    END

    expected = <<~END
      Field #1:
      1*
    END

    expect(sweep(input)).to eq expected
  end

  it "given a 1 by 3 minefield full of mines, return *s" do
    input = <<~END
      1 3
      ***
    END

    expected = <<~END
      Field #1:
      ***
    END

    expect(sweep(input)).to eq expected
  end

  it "given a 1 by 3 minefield with a mine in the center" do
    input = <<~END
      1 3
      .*.
    END

    expected = <<~END
      Field #1:
      1*1
    END

    expect(sweep(input)).to eq expected
  end

  it "givena 1x3 row with two mines on the edges, show a 2 between" do
    input = <<~END
      1 3
      *.*
    END

    expected = <<~END
      Field #1:
      *2*
    END

    expect(sweep(input)).to eq expected
  end

  it "given a wide one row minefield with a few mines" do
    input = <<~END
      1 11
      .*.*.*.*.*.
    END

    expected = <<~END
      Field #1:
      1*2*2*2*2*1
    END

    expect(sweep(input)).to eq expected
  end

  it "given a 2x1 field with no mines" do
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

    expect(sweep(input)).to eq expected
  end

  # it "given a 2x2 field with a mine in the top left" do
  #   input = <<~END
  #     2 2
  #     *.
  #     ..
  #   END

  #   expected = <<~END
  #     Field #1:
  #     *1
  #     11
  #   END

  #   expect(sweep(input)).to eq expected
  # end


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

  #   expect(sweep(input)).to eq (expected)
  # end
end
