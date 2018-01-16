require "rspec/autorun"

theMainObject = self

RSpec.describe "The main object" do

  it "can be referenced using `self` on the top level" do
    # `theMainObject` is assigned to `self` on the top level
    expect(theMainObject).not_to be nil
  end

end

RSpec.describe "Ruby Objects" do

  it "return a list of methods when receiving the message `methods`" do
    expect(self.methods).to include :methods
  end

  it "messages sent to no particular object are sent to `self`" do
    expect(self.methods).to eq methods
  end

  it "inside a class, `self` references the object" do
    class ExampleClass
      def return_self
        self
      end
    end

    object = ExampleClass.new()

    expect(object.return_self).to eq object
  end

end
