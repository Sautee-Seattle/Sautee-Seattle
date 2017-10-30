require 'rails_helper'

RSpec.describe RecipesController, type: :feature do
  let(:ingredient) {create(:ingredient_with_recipes)}
  let(:user) { create(:user) }

  describe "#new" do

    xit "renders recipe new" do
      # session[:user_id] = user.id
      visit "ingredients/#{ingredient.id}/recipes/new"
      expect(page).to have_content 'add your recipe!'
      fill_in('post_title', :with => 'post_title')
      fill_in('post_body', :with => 'post_body')
      find('[name=commit]').click

      p page.html

      expect(page).to eq recipe_path(Post.last)
    end

  end

end
