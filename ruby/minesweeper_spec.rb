require ('./minesweeper.rb')
RSpec.describe "Minesweeper" do
  it "sweeps a single field with a single safe square" do
    expect(Minesweeper.new.sweep "1 1\n.\n0 0" ).to eq "Field #1:\n0"
  end

  it "sweeps a single field with a single mined square" do
    expect(Minesweeper.new.sweep "1 1\n*\n0 0" ).to eq "Field #1:\n*"
  end

  it "sweeps a single field with two horizontal mined squares" do
    expect(Minesweeper.new.sweep "1 1\n**\n0 0" ).to eq "Field #1:\n**"
  end

  it "sweeps a single field with two horizontal safe squares" do
    expect(Minesweeper.new.sweep "1 1\n..\n0 0" ).to eq "Field #1:\n00"
  end
end
