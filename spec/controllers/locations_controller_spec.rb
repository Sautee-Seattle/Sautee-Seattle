require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  let!(:ingredient) {Ingredient.create!(name: "Carrot")}
  let!(:user) {User.create!(username: "Bob", email: "bob@bob.com", password: "bob", bio: "Bob things.")}
  let!(:post) {Post.create!(post_type: "location", title: "Post number 1", body: "This is post 1's body!", url: "#", user: user)}

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

end
