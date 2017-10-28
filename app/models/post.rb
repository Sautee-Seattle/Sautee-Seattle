class Post < ApplicationRecord
  has_many :ingredients_posts
  has_many :ingredients, through: :ingredients_posts
  belongs_to :user

  validates :post_type, :title, :body, presence: true
end
