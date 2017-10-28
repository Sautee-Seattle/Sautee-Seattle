require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "#show" do
    let(:ingredient) { create(:ingredient_with_recipes_and_locations) }
    before(:each) { get :show, params: {id: ingredient.id} }

    it "returns 200" do
      expect(response).to be_ok
    end

    it "assigns an ingredient instance variable" do
      expect(assigns[:ingredient].kind_of?(Ingredient)).to eq(true)
    end
  end
end
