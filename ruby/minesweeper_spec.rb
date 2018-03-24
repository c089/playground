def show(input)
  <<~END
    Field #1:
    0
  END
end

RSpec.describe "Minesweeper" do
  it "given a field with a single field that does not have a mine, returns a 0" do
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
