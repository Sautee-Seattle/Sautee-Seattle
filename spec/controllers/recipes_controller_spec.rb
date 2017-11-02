require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:ingredient) {create(:ingredient_with_recipes)}
  let(:user) { create(:user) }
  let!(:new_post) {Post.create!(post_type: "recipe", title: "Post number 1", body: "This is post 1's body!", url: "#", user: user)}


  describe "#index" do
    before(:each) {get :index, params: {ingredient_id: ingredient.id}}
    it "renders template :index" do
      expect(response).to render_template :index
    end
    it "assigns the right ingredient instance variable" do
      expect(assigns[:ingredient]).to eq ingredient
    end
  end


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

    it "assigns an instance variable of #body" do
      expect(assigns[:body]).to_not be nil
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
  context "resipes#destroy" do
    it "responds with status code 302" do
      delete :destroy, params: {id: new_post.id}
      expect(response.status).to eq 302
    end

     it "deletes the resipe" do
       expect{delete :destroy, params: {id: new_post.id}}.to change(Post,:count).by(-1)
     end

     it "redirects to users#show" do
       delete :destroy, params: {id: new_post.id}
       expect(response).to redirect_to user_path(user)
     end
  end
end
