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

        xit "should have followers" do
          @thing.followers.should == [@user]
        end

    end

end
