require 'rails_helper'

RSpec.describe SeasonsIngredient, type: :model do
    describe "Seasons & Ingredients should have a relationship " do
        let!(:season) {Season.create!(:name => "Fall")}
        let!(:ingredient) {Ingredient.create!(:name => "Potato")}
        before(:each) do
            season.ingredients << ingredient
        end
        it "Seasons are added properly to SeasonsIngredient" do
            expect(SeasonsIngredient.first.season).to eq season
        end
        it "Ingredients are added properly to SeasonsIngredient" do
            expect(SeasonsIngredient.first.ingredient).to eq ingredient
        end
        it "Seasons have many Ingredients" do
          expect(season.ingredients.first.name).to eq "Potato"
        end
        it "Ingredients have many Seasons" do
          expect(ingredient.seasons.first.name).to eq "Fall"
        end
    end

end
