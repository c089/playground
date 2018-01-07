class StringCalculator
  def calculate(input)
    if input == ""
      0
    else
      comma = input.index(',')
      newline = input.index("\n")
      if comma
        first_number = input[0..comma-1]
        remaining_input = input[comma+1..input.length]
        calculate(first_number) + calculate(remaining_input)
      elsif newline
        first_number = input[0..newline-1]
        remaining_input = input[newline+1..input.length]
        calculate(first_number) + calculate(remaining_input)
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

  it "can add many numbers" do
    expect(StringCalculator.new.calculate("1,2,3,4,5")).to eq 15
  end

  it "can numbers separated by newlins" do
    expect(StringCalculator.new.calculate("1\n2")).to eq 3
  end
end
