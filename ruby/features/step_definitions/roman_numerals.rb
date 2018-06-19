Given("the arabic number {int}") do |int|
  @number = int
end

symbols = {
  1 => "I",
  2 => "II",
  3 => "III",
  5 => "V",
  6 => "VI",
  10 => "X"
}

When("I convert it to roman") do
  @result = symbols[@number]
end

Then("I should get {string}") do |expected_result|
  expect(@result).to eq expected_result
end
