require ('./minesweeper.rb')
RSpec.describe "Minesweeper" do
  it "sweeps a single field with a single safe square" do
    expect(Minesweeper.new.sweep "1 1\n.\n0 0" ).to eq "Field #1\n0"
  end
end
