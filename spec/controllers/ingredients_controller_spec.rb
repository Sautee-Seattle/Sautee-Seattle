require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "#show" do
    let(:ingredient) { create(:ingredient_with_posts) }
    before(:each) { get :show, params: {id: ingredient.id} }

    it "returns 200" do
      expect(response).to be_ok
    end

    it "assigns an ingredient instance variable" do
      expect(assigns[:ingredient].kind_of?(Ingredient)).to eq(true)
    end

    it "assigns a locations instance variable to an array" do
      expect(assigns[:locations].kind_of?(Array)).to eq(true)
    end

    it "assings a recipes instance variable to an array" do
      expect(assigns[:recipes].kind_of?(Array)).to eq(true)
    end
  end
end
