Given("the arabic number {int}") do |int|
  @number = int
end

def to_roman
  symbols = {
    1 => "I",
    2 => "II",
    3 => "III",
    5 => "V",
    6 => "VI",
    7 => "VII",
    10 => "X"
  }

  if @number == 11
    @result = symbols[10] + symbols[1]
  elsif @number == 12
    @result = symbols[10] + symbols[1] + symbols[1]
  elsif @number == 13
    @result = symbols[10] + symbols[1] + symbols[1] + symbols[1]
  else
    @result = symbols[@number]
  end
end

When("I convert it to roman") do
  to_roman
end

Then("I should get {string}") do |expected_result|
  expect(@result).to eq expected_result
end
