require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:ingredient) {create(:ingredient_with_recipes)}
  let(:user) { create(:user) }

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

  describe "#new" do

    it "renders recipe new" do
      get :new, params: { ingredient_id: ingredient.id}
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    let(:new_recipe) { {post_type: 'recipe', title: 'hassan scramble', body: "just beat it"} }
    it "redirects to recipe#show if it is valid" do
      post :create, params: { ingredient_id: ingredient.id, post: new_recipe }, session: { user_id: user.id }
      expect(response).to redirect_to(user_recipe_path(Post.last.user, Post.last))
    end

    it "redirects to recipe#new" do
      ingredient_1 = create(:ingredient)
      post :create, params: { ingredient_id: ingredient.id, post: {post_type: 'recipe', title: 'hassan scramble'}, ingredients: { ingredient_1.name =>"on" } }, session: { user_id: user.id }
      expect(response).to render_template :new
    end
  end
end
