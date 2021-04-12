require_relative "spec_helper"

RSpec.describe Array do
  context "#all_empty?" do
    it "returns true if all elements of the Array are empty" do
      expect(["","",""].all_empty?).to be true
    end
  end

  context "#all_same?" do
    it "returns true if all the elements are the same" do 
      expect(["A", "A", "A"].all_same?).to be true
    end 
  end
end