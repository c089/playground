require './minesweeper.rb'
Given("some minefields") do |minefields|
  @input = minefields
end

When("I sweep the fields") do
  @result = Minesweeper.new.sweep(@input)
end

Then("I should see the minefields with hint numbers:") do |expected_minefields|
  expect(@result).to eq(expected_minefields)
end
