require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let!(:ingredient) { create(:ingredient_with_recipes_and_locations, name: "Squash") }

  describe "associations" do
    it { should have_many(:posts) }

  end

  describe "virtual attributes" do
    it "#recipes should return all posts of type 'recipe' alphabetized" do
      all_recipes = Ingredient.find(ingredient.id).posts.select {|post| post.post_type == "recipe"}

      all_recipes =  all_recipes.sort { |a,b| a.title <=> b.title }

      expect(ingredient.recipes).to eq(all_recipes)
    end

    it "#locations should return all posts of type 'location' alphabetized" do
      all_locations = Ingredient.find(ingredient.id).posts.select {|post| post.post_type == "location"}

      all_locations = all_locations.sort { |a,b| a.title <=> b.title }

      expect(ingredient.locations).to eq(all_locations)
    end
  end

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
