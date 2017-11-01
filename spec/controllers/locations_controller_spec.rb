require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  let!(:ingredient) {Ingredient.create!(name: "Carrot")}
  let!(:user) {User.create!(username: "Bob", email: "bob@bob.com", password: "bob", bio: "Bob things.")}
  let!(:new_post) {Post.create!(post_type: "location", title: "Post number 1", body: "This is post 1's body!", url: "#", user: user)}

  context "locations#index" do
    it 'renders the locations :index page when successful' do
      get :index, params: {ingredient_id: ingredient.id}
      expect(response).to render_template :index
    end
    it 'returns a status of 200 when successful' do
      get :index, params: {ingredient_id: ingredient.id}
      expect(response.status).to be 200
    end
    it "assigns an ingredient instance variable" do
      get :index, params: {ingredient_id: ingredient.id}
      expect(assigns[:ingredient].kind_of?(Ingredient)).to eq(true)
    end
  end

  context "locations#new" do
    it 'renders the locations :new page when successful' do
      get :new, params: {ingredient_id: ingredient.id, post_id: new_post.id}
      expect(response).to render_template :new
    end
    it 'returns a status of 200 when successful' do
      get :new, params: {ingredient_id: ingredient.id, post_id: new_post.id}
      expect(response.status).to be 200
    end
    it "assigns an ingredient instance variable" do
      get :new, params: {ingredient_id: ingredient.id, post_id: new_post.id}
      expect(assigns[:ingredient].kind_of?(Ingredient)).to eq(true)
    end
  end

  context "locations#create" do
    it 'renders the :new template upon failure to create location when logged in' do
      post :create, session: {user_id: user.id}, params: {ingredient_id: ingredient.id, post: {post_type: "location", title: "Post number 1", body: "This is post 1's body!"}}
      expect(response).to render_template :new
    end
    it 'redirects to the seasons_path when not logged in' do
      post :create, session: {user_id: nil}, params: {ingredient_id: ingredient.id, post: {post_type: "location", title: "Post number 1", body: "This is post 1's body!"}}
      expect(response).to redirect_to seasons_path
    end
    it 'redirects to the ingredient_path when logged in with valid post' do
      post :create, session: {user_id: user.id}, params: {ingredient_id: ingredient.id, post: {post_type: "location", title: "Post number 2", body: "This is post 2's body!"}}
      expect(response).to redirect_to ingredient_path(ingredient)
    end
  end
end
