def to_roman(arabic_number)
  roman_numerals = {
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
  }
  numeral = roman_numerals[arabic_number]
  if numeral
    numeral
  else
    to_roman(arabic_number - 1) + to_roman(1)
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
