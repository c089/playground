Given("the arabic number {int}") do |int|
  @number = int
end

When("I convert it to roman") do
  @result = if @number == 1
    "I"
  elsif @number == 5
    "V"
  else
    "X"
  end
end

Then("I should get {string}") do |expected_result|
  expect(@result).to eq expected_result
end
