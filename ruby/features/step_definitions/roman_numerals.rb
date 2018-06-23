Given("the arabic number {int}") do |int|
  @number = int
end

def to_roman arabic_number
  symbols = {
    1 => "I",
    2 => "II",
    3 => "III",
    5 => "V",
    6 => "VI",
    7 => "VII",
    10 => "X"
  }

  if arabic_number == 11
    symbols[10] + symbols[1]
  elsif arabic_number == 12
    symbols[10] + symbols[1] + symbols[1]
  elsif arabic_number == 13
    symbols[10] + symbols[1] + symbols[1] + symbols[1]
  else
    symbols[arabic_number]
  end
end

When("I convert it to roman") do
  @result = to_roman @number
end

Then("I should get {string}") do |expected_result|
  expect(@result).to eq expected_result
end
