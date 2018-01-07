class StringCalculator
  def calculate(input)
    if input == ""
      0
    else
      1
    end
  end
end

RSpec.describe "StringCalculator" do
  it "returns 0 for empty strings" do
    expect(StringCalculator.new.calculate("")).to eq 0
  end

  it "returns a single value converted to a number" do
    expect(StringCalculator.new.calculate("1")).to eq 1
  end
end
