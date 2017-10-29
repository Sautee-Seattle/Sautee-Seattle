class Post < ApplicationRecord
  has_many :ingredients_posts
  has_many :ingredients, through: :ingredients_posts
  belongs_to :user

  validates :post_type, :title, :body, :url, presence: true
  validates :title, uniqueness: {scope: :post_type}

  def is_recipe?
    post_type == "recipe"
  end

  def is_location?
    post_type == "location"
  end

  before_validation do
    if is_recipe?
      self.url = "pan.png"
    else
      self.url = "#"
    end
  end
end
