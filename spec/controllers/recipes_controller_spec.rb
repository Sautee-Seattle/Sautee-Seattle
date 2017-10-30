require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "#show" do
    let!(:user) { create(:user) }
    let(:recipe) { create(:post) }
    before(:each) { get :show, params: {user_id: user.id, id: recipe.id} }

    it "returns 200" do
      expect(response).to be_ok
    end

    it "assigns an recipe instance variable" do
      expect(assigns[:recipe]).to be_a Post
    end

    it "the assigned instance variable has a type of recipe" do
      expect(assigns[:recipe].post_type).to eq 'recipe'
    end
  end
end
