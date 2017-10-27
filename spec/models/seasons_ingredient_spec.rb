require 'rails_helper'

RSpec.describe SeasonsIngredient, type: :model do
  let!(:season) {Season.create!(name: "Fall")}
  let!(:ingredient) {Ingredient.create!(name: "Squash")}

  context "Season Associations" do
    it "season has an ingredient" do
      
    end
  end

end
