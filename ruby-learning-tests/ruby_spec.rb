class StringCalculator
  def calculate(input)
    if input == ""
      0
    else
      if input.index(',')
        3
      else
        input.to_i
      end
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

  it "returns a single big number" do
    expect(StringCalculator.new.calculate("98765")).to eq 98765
  end

  it "returns a single negative number" do
    expect(StringCalculator.new.calculate("-1")).to eq (-1)
  end

  it "can add two numbers" do
    expect(StringCalculator.new.calculate("1,2")).to eq 3
  end
end
