require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "associations" do
    it { should have_many(:posts) }
  end

  describe "virtual attributes" do
    let(:ingredient) { create(:ingredient_with_recipes_and_locations) }
    it "#recipes should return all posts of type 'recipe'" do
      all_recipes = Ingredient.find(ingredient.id).posts.select {|post| post.post_type == "recipe"}
      expect(ingredient.recipes).to eq(all_recipes)
    end
    it "#locations should return all posts of type 'location'" do
      all_locations = Ingredient.find(ingredient.id).posts.select {|post| post.post_type == "location"}
      expect(ingredient.locations).to eq(all_locations)
    end
  end
end
