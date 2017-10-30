require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  let!(:ingredient) {Ingredient.create!(name: "Carrot")}
  let!(:user) {User.create!(username: "Bob", email: "bob@bob.com", password: "bob", bio: "Bob things.")}
  let!(:post) {Post.create!(post_type: "location", title: "Post number 1", body: "This is post 1's body!", url: "#", user: user)}

  context "ingredients#show" do
    it 'renders the ingredients :show page when successful' do
      get :show, params: {id: ingredient.id}
      expect(response).to render_template :show
    end
    it "returns status of 200 if successful" do
      get :show, params: {id: ingredient.id}
      expect(response.status).to eq 200
    end
    it "assigns an ingredient instance variable" do
      get :show, params: {id: ingredient.id}
      expect(assigns[:ingredient].kind_of?(Ingredient)).to eq(true)
    end
  end
end
