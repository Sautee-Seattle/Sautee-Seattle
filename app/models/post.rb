class Post < ApplicationRecord
  has_many :ingredients_posts
  has_many :posts, through: :ingredients_posts
end
