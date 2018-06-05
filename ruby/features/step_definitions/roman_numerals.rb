def to_roman(arabic_number)
  if arabic_number == 1
    "I"
  elsif arabic_number == 2
    "II"
  else
    "III"
  end
end

Given("the arabic number {int}") do |int|
  @number = int # Write code here that turns the phrase above into concrete actions
end

When("I convert it to roman") do
  @result = to_roman(@number)
end

Then("I should get {string}") do |expected_result|
  expect(@result).to eq expected_result
end
