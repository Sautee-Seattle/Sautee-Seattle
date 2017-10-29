require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "ingredients/posts/index" do
    let(:ingredient) { create(:ingredient_with_recipes) }
    before(:each) { get :index, params: { ingredient_id: ingredient.id} }

    it "renders ingredients_posts template" do
      expect(response).to render_template(:index)
    end

    it "assigns an ingredient instance variable" do
      expect(assigns[:ingredient]).to eq(ingredient)
    end
  end
end
