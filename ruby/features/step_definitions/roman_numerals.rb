def to_arabic(roman_number)
  "I"
end

Given("the arabic number {int}") do |int|
  @number = int # Write code here that turns the phrase above into concrete actions
end

When("I convert it to roman") do
  @result = to_arabic(@number)
end

Then("I should get {string}") do |expected_result|
  expect(@result).to eq expected_result
end
