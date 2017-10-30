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

  context "locations#new" do
    it ":new has expected content" do
      visit("/ingredients/#{ingredient.id}/posts/#{post.id}/locations/new")
      expect(page).to have_content 'Share Location'
    end
    it "renders the :new page successfully" do
      visit("/ingredients/#{ingredient.id}/posts/#{post.id}/locations/new")
      expect(page).to have_current_path(new_ingredient_post_location_path(ingredient.id, post.id))
    end
  end

  context "locations#create" do
    it "renders the :new page successfully" do
      visit("/ingredients/#{ingredient.id}/posts/#{post.id}/locations/new")
      click_button('Submit')
      expect(page).to have_current_path(seasons_path)
    end
    # it ":create has expected content" do
    #   visit("/ingredients/#{ingredient.id}/posts/#{post.id}/locations/new")
    #   click_button('Submit')
    #   # save_and_open_page
    #   # print page.html
    #   expect(page.find('#container')).to have_content 'Share Location'
    #   # expect(page).to have_content 'Share Location'
    # end
  end

end
