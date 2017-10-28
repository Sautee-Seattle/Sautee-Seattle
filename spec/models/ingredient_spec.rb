require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let!(:ingredient) {Ingredient.create!(name: "Squash")}

  context "Attributes" do
    it "has a name" do
      expect(ingredient.name).to eq "Squash"
    end
    it "is valid if name is provided" do
      expect(ingredient.valid?).to eq true
    end
    it "is invalid if name is not provided" do
      ingredient.name = nil
      expect(ingredient).to_not be_valid
    end
  end

end
