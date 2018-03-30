RSpec.describe "Minesweeper" do
  it "passes the acceptance test" do
    input = <<~END
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
    END

    expected = <<~END
      Field #1:
      *100
      2210
      1*10
      1110

      Field #2:
      **100
      33200
      1*100
    END

    expect(sweep(input)).to eq (expected)
  end
end
