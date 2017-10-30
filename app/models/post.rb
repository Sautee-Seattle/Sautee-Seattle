class Post < ApplicationRecord
  has_many :ingredients_posts
  has_many :ingredients, through: :ingredients_posts
  belongs_to :user

  validates :url, presence: true
  validates :post_type, :url, presence: true
  validate :title_validation
  validate :body_validation
  validates :title, uniqueness: {scope: :post_type}

  def is_recipe?
    post_type == "recipe"
  end

  def is_location?
    post_type == "location"
  end

  def title_validation
    errors[:base] << "Name can't be blank." if is_location? && !title.present?
    errors[:base] << "Recipe name can't be blank." if is_recipe? && !title.present?

  end

  def body_validation
    errors[:base] << "Address can't be blank." if is_location? && !body.present?
    errors[:base] << "Directions can't be blank." if is_recipe? && !body.present?
  end

  before_validation do
    if !self.url || self.url == ""
      if is_recipe?
        self.url = "pan.png"
      else
        self.url = "#"
      end
    end
  end
end
