RSpec.describe "Minesweeper" do
  def sweep(input)
    if input[4] == "*"
      <<~END
        Field #1:
        *
      END
    else
      <<~END
        Field #1:
        0
      END
    end
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
