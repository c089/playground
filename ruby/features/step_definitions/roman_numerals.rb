def to_roman(arabic_number)
  if arabic_number == 1
    "I"
  elsif arabic_number == 2
    "I" + "I"
  elsif arabic_number == 3
    "II" + "I"
  elsif arabic_number == 4
    "I" + "V"
  elsif arabic_number == 5
    "V"
  elsif arabic_number == 6
    "V" + "I"
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
