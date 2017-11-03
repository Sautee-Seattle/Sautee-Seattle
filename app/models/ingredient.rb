class Ingredient < ApplicationRecord
  has_many :seasons_ingredients
  has_many :seasons, through: :seasons_ingredients

  has_many :ingredients_posts
  has_many :posts, through: :ingredients_posts

  validates :name, :image, presence: true

  def recipes
    recipes = posts.select {|post| post.post_type == "recipe"}
    recipes.sort { |a,b| a.title <=> b.title }
  end

  def locations
    locations = posts.select {|post| post.post_type == "location"}
    locations.sort { |a,b| a.title <=> b.title }
  end

  before_validation do
    if !self.image || self.image == ""
      self.image = "ingredients.jpeg"
    end
  end
end
