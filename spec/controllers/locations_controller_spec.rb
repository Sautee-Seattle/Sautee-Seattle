require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  let!(:ingredient) {Ingredient.create!(name: "Carrot")}
  let!(:user) {User.create!(username: "Bob", email: "bob@bob.com", password: "bob", bio: "Bob things.")}
  let!(:post) {Post.create!(post_type: "location", title: "Post number 1", body: "This is post 1's body!", url: "#", user: user)}

  context "locations#index" do
    it 'renders the :index page successfully' do
      get "ingredients/#{ingredient.id}/locations"
      expect(response).to render_template :index
    end
    it 'returns a status of 200 successfully'
  end

  context "locations#index" do
    it 'renders the :index page successfully'
    it 'returns a status of 200 successfully'
  end





end
