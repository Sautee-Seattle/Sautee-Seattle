require 'rails_helper'

RSpec.describe LocationsController, type: :feature do
  let!(:ingredient) {Ingredient.create!(name: "Carrot")}
  let!(:user) {User.create!(username: "Bob", email: "bob@bob.com", password: "bob", bio: "Bob things.")}
  let!(:post) {Post.create!(post_type: "location", title: "Post number 1", body: "This is post 1's body!", url: "#", user: user)}

  context "locations#index" do
    it ":index has expected content" do
      visit("/ingredients/#{ingredient.id}/locations")
      expect(page).to have_content 'More places to go...'
    end
    it "renders the :index page successfully" do
      visit("/ingredients/#{ingredient.id}/locations")
      expect(page).to have_current_path(ingredient_locations_path(ingredient.id))
    end
  end
end
