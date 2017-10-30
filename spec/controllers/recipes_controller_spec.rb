require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:ingredient) {create(:ingredient_with_recipes)}
  let(:user) { create(:user) }

  describe "#new" do

    it "renders recipe new" do
      get :new, params: { ingredient_id: ingredient.id}
      expect(response).to render_template(:new)
    end

  end

  describe "#create" do
    let(:new_recipe) { {post_type: 'recipe', title: 'hassan scramble', body: "just beat it"} }
    # before(:each) do
    #   post :create, params: { ingredient_id: ingredient.id, post: new_recipe }, session: { user_id: user.id }
    # end
    it "redirects to recipe#show if it is valid" do
      post :create, params: { ingredient_id: ingredient.id, post: new_recipe }, session: { user_id: user.id }
      expect(response).to redirect_to(recipe_path(Post.last))
    end

    it "redirects to recipe#new" do
      ingredient_1 = create(:ingredient)
      post :create, params: { ingredient_id: ingredient.id, post: {post_type: 'recipe', title: 'hassan scramble'}, ingredients: { ingredient_1.name =>"on" } }, session: { user_id: user.id }
      expect(response).to render_template :new
    end
  end

end
