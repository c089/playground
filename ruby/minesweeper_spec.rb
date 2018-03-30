RSpec.describe "Minesweeper" do
  def sweep_field(previous, current, nextField)
    def is_mine(field)
      field == "*"
    end

    def is_safe(field)
      field == "."
    end

    if is_mine(current)
      "*"
    elsif is_safe(current) and is_mine(previous) and is_mine(nextField)
      "2"
    elsif is_safe(current) and is_mine(previous) or is_mine(nextField)
      "1"
    elsif is_safe(current)
      "0"
    else
      ""
    end
  end

  def sweep(input)
    minefield = ""
    i = 3
    while i <= input.length
      minefield += sweep_field(input[i], input[i+1], input[i+2])
      i += 1
    end

    "Field #1:\n" + minefield + "\n"
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
      1 1 *
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
      1 7
      .*.*.*.
    END

    expected = <<~END
      Field #1:
      1*2*2*1
    END

    expect(sweep(input)).to eq expected
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

  #   expect(sweep(input)).to eq (expected)
  # end
end
