class StringCalculator
  def calculate(input)
    if input == ""
      0
    else
      comma = input.index(',')
      if comma
        first_number = input[0..comma].to_i
        second_number = input[comma+1..input.length].to_i
        first_number + second_number
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
    expect(StringCalculator.new.calculate("1,1")).to eq 2
  end

  it "can add two large numbers" do
    expect(StringCalculator.new.calculate("1024,1024")).to eq 2048
  end
end
