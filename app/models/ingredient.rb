class Ingredient < ApplicationRecord
  has_many :seasons_ingredients
  has_many :seasons, through: :seasons_ingredients

  has_many :ingredients_posts
  has_many :posts, through: :ingredients_posts

  validates :name, :description, presence: true

  def recipes
    posts.select {|post| post.post_type == "recipe"}
  end

  def locations
    posts.select {|post| post.post_type == "location"}
  end
end
