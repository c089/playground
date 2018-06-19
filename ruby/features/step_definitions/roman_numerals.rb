Given("the arabic number {int}") do |int|
  @number = int
end

symbols = {
  1 => "I",
  5 => "V",
}

When("I convert it to roman") do
  @result = if @number == 1
    symbols[@number]
  elsif @number == 5
    symbols[@number]
  else
    "X"
  end
end

Then("I should get {string}") do |expected_result|
  expect(@result).to eq expected_result
end
